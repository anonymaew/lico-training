import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import datasets, transforms
from torch.utils.data import DataLoader
from time import time

device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(f"Using device: {device}")

transform = transforms.Compose(
    [
        transforms.ToTensor(),
        transforms.Normalize((0.1307,), (0.3081,)),  # mean, std for MNIST
    ]
)

train_set = datasets.MNIST(
    root="./data", train=True, download=True, transform=transform
)
test_set = datasets.MNIST(
    root="./data", train=False, download=True, transform=transform
)

batch_size = 128
train_loader = DataLoader(
    train_set, batch_size=batch_size, shuffle=True, pin_memory=True
)
test_loader = DataLoader(
    test_set, batch_size=batch_size, shuffle=False, pin_memory=True
)


class SimpleCNN(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv = nn.Sequential(
            nn.Conv2d(1, 32, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.MaxPool2d(2),
            nn.Conv2d(32, 64, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.MaxPool2d(2),
        )
        self.fc = nn.Sequential(
            nn.Flatten(), nn.Linear(64 * 7 * 7, 128), nn.ReLU(), nn.Linear(128, 10)
        )

    def forward(self, x):
        x = self.conv(x)
        return self.fc(x)


model = SimpleCNN().to(device)
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)


def train_one_epoch():
    model.train()
    total_loss = 0
    for batch_idx, (data, target) in enumerate(train_loader):
        data, target = (
            data.to(device, non_blocking=True),
            target.to(device, non_blocking=True),
        )

        optimizer.zero_grad()
        output = model(data)
        loss = criterion(output, target)
        loss.backward()
        optimizer.step()

        total_loss += loss.item()
    avg_loss = total_loss / len(train_loader)
    print(f"Training: avg loss = {avg_loss:.4f}")


def evaluate():
    model.eval()
    correct = 0
    with torch.no_grad():
        for data, target in test_loader:
            data, target = data.to(device), target.to(device)
            output = model(data)
            pred = output.argmax(dim=1)
            correct += pred.eq(target).sum().item()
    acc = 100.0 * correct / len(test_loader.dataset)
    print(f"Testing: {acc:.4f}%")


start_timestamp = time()

num_epochs = 5
for epoch in range(num_epochs):
    print(f"\n--- Epoch {epoch + 1} ---")
    train_one_epoch()
    evaluate()

elapsed = time() - start_timestamp
print(f"""############
      Elapsed time: {elapsed:d} seconds for {num_epochs} epochs, {
    (elapsed / num_epochs):.2f} sec/epoch on {device}
############""")
