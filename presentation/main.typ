#import "@preview/polylux:0.4.0": *
#import "theme.typ": presentation_theme
#import "utils.typ": date_to_string, mstr
#import "metadata.typ": title,description,author,date, institution

#show: presentation_theme.with()

#set text(lang: "th")
// #set text(lang: "en")

#set document(
  title: title,
  author: "Napat Srichan",
  date: date
)

#slide[
  #align(center + horizon)[
    = #title

    #text(size: .8em)[#description]
  ]

  #place(bottom + right)[
    #author

    #set text(size: .6em)
    #date_to_string(dt: date)

    #institution
  ]

  #place(bottom+left)[
    #text(size: 0.6em)[
      #mstr(
        link("./lico-training.pdf")[Thai version available],
        link("./lico-training.en.pdf")[มีเวอร์ชันภาษาอังกฤษ],
      )
    ]

    #grid(
      columns: (120pt, 120pt),
      gutter: 1em,
      image("images/lenovo.webp"),
      image("images/logo.webp")
    )
  ]
]

#counter(page).update(0)
#set page(
  header: place(top + right, dy:1em)[
    #box[#image("images/logo.webp", width: 120pt)]
  ],
  footer: context [
    #align(right)[
      #box(width: 30%, outset: (y:1em, right: 3em), fill: rgb("#1c75bc"))[
        #set text(size: .6em, fill: white)
        #toolbox.all-sections((sections, current) => {
          sections.find(s => s == current)
        }) #box(inset: (x:0.5em))[|] #counter(page).display()
      ]
    ]
  ]
)

#slide[
  == #mstr("Outline", "หัวข้อ")

  #toolbox.all-sections((sections, current) => {
    enum(..sections)
  })
]

#slide[
  #toolbox.register-section[#mstr("Introduction", "เกริ่นนำ")]

  == #mstr("Introduction", "เกริ่นนำ")

  #align(horizon)[
    #grid(
      columns: (1fr,1fr,1fr),
      gutter: 1em,
      image("images/me-1.webp"),
      image("images/me-3.webp"),
      image("images/me-2.webp")
    )
  ]
]


#slide[
  #align(center + horizon)[
    #text(size: 2em)[== #mstr("Why are we here?", "ทำไม")]

    #show: later
    #mstr("essential tools", "เครื่องมือสำคัญ")
    #show: later
    , #mstr("self-governance", "พึ่งพาตนเองได้")
  ]
]


#slide[
  #toolbox.register-section[#mstr("Background knowledge", "ความsู้พื้นฐาน")]

  == CUDA

  Compute Unified Device Architecture
  #footnote("https://developer.nvidia.com/cuda")
  #footnote("https://www.modular.com/blog/democratizing-ai-compute-part-3-how-did-cuda-succeed")
  .

  #box(height: 50%)[
    #grid(
      columns: (1fr,1fr),
      gutter: 2em,
      align(right)[#image("images/cuda-chart.webp")],
      image("images/cuda-chart-2.webp"),
    )
  ]
]

#slide[
  == H100

  #mstr("NVIDIA Enterprise GPU Accelerator (Hopper generation).",
        "การ์ดจอระดับอุตสาหกรรมจาก NVIDIA (รุ่น Hopper)") #footnote("https://www.nvidia.com/en-us/data-center/h100/")

  #align(center)[
    #image("images/nvidia-h100.webp", width: 40%)
  ]
]

#slide[
  == Slurm

  #mstr("Workload manager for multiple servers based on resources.",
        "โปรแกรมจัดการภาระงาน/ทรัพยากรสำหรับเซิร์ฟเวอร์หลายเครื่อง")
        #footnote("https://slurm.schedmd.com/overview.html#architecture")

  #align(center)[
    #image("images/slurm.webp", height: 50%)
  ]
]

#slide[
  == LiCO

  #mstr("Lenovo's Slurm platform, controllable via web GUI",
        "โปรแกรม Slurm โดย Lenovo ควบคุมผ่านเว็บได้")

  #grid(
    columns: (1fr,1fr),
    image("images/lico-1.webp"),
    image("images/lico-2.webp")
  )
]

#slide[
  == Kaen-Coon (แก่นคูณ)

  #box(height: 70%)[
    #grid(
      columns: (1fr,1fr),
      gutter: 2em,
      align(right)[#image("images/kaencoon-1.webp")],
      image("images/kaencoon-2.webp")
    )
  ]
]

#slide[
  == Summarized flow

  1. #mstr("Login to LiCO",
           "ล็อคอินเข้าระบบ LiCO")
  2. #mstr("Drop in scripts and data files",
           "ใส่โปรแกรมและข้อมูลลงไป")
  2. #mstr("Create a Job",
           "สร้าง Job")
  3. #mstr("Run a Job and monitor",
           "รัน Job และตรวจสอบสถานะ")
  4. #mstr("Extract artifacts",
           "ดึงผลลัพธ์ออกมา")
]



#slide[
  #toolbox.register-section(mstr("Hello World on LiCO", "เขียน Hello World บน LiCO"))
  
  == #mstr("Prerequisite","เงื่อนไขที่ควรมี")

  - #mstr("A code editor: VSCode, or the equivalence",
          "โปรแกรมเขียนโค้ด: VSCode หรือโปรแกรมอื่น ๆ เทียบเท่า")
  - #mstr("Proficient at Python, somewhat similar to PyTorch",
          "ชำนาญภาษา Python และเคยใช้ PyTorch มาก่อน")
  - #mstr("Knowing command line commands is a plus; ability to debugging from logs",
          "รู้จักคำสั่ง command line จะดีมาก; สามารถแก้ bug จาก logs ได้บ้าง")
  - #mstr("Access to internal KKU network (VPN if outside)",
          "เข้าถึงเครือข่ายภายใน มข. ได้ (ต้อง VPN เข้ามาหากอยู่ภายนอก)")
  - #mstr("Username/password (ask staff for the stub)",
          "Username/password (ยกมือขอ staff หากยังไม่ได้)")
]

#slide[
  #align(center+horizon)[
    #mstr("Write/submit first program on LiCO!","เขียน/ส่งโปรแกรมเข้า LiCO กัน!")

    #set text(size: 0.6em)

    LiCO #mstr("at", "ที่") https://10.198.253.15:8000

    https://github.com/anonymaew/lico-training/tree/main/01-hello_world
  ]
]

#slide[
  == #mstr("Observations", "ข้อสังเกต")

  #item-by-item[
    - #mstr("Slurm is just shell scripting",
            "Slurm คือการเขียนโปรแกรม shell")
    - #mstr("We saw queuing in action",
            "เราเห็นการคิวงานทำงานจริง")
    - #mstr("Quite outdated Python version (3.6)",
            "เวอร์ชัน Python ค่อนข้างเก่า (3.6)")
  ]
]

#slide[
  #toolbox.register-section(mstr("Model Training on LiCO", "เทรนโมเดลบน LiCO"))

  #align(center+horizon)[
    #mstr("Let's try training models on LiCO","ลองเทรนโมเดลบน LiCO")

    #set text(size: 0.6em)
    https://github.com/anonymaew/lico-training/tree/main/02-mnist_trainnig
  ]
]

#slide[
  == #mstr("Observations", "ข้อสังเกต")

  #item-by-item[
    - #mstr("Use specific container",
            "ต้องใช้คอนเทนเนอร์เฉพาะ")
    - #mstr("Virtual environment is required",
            "จำเป็นต้องใช้ virtual environment")
    - #mstr("Relatively slow (we still use CPU)",
            "ค่อนข้างช้า (เรายังใช้ CPU อยู่)")
  ]
]

#slide[
  #toolbox.register-section(mstr("Utilize GPU on LiCO", "ใช้งานการ์ดจอบน LiCO"))

  #align(center+horizon)[
    #mstr("Utilize GPU to train models on LiCO","ใช้การ์ดจอเทรนโมเดลบน LiCO")

    #set text(size: 0.6em)
    https://github.com/anonymaew/lico-training/tree/main/03-mnist_trainnig_cuda
  ]
]

#slide[
  == #mstr("Observations", "ข้อสังเกต")

  #item-by-item[
    - #mstr("Huge speedup with GPU",
            "เทรนเร็วขึ้นมากด้วย GPU")
    - #mstr("MIG specification is necessary",
            "ต้องระบุว่าใช้ MIG ทุกครั้ง")
    - #mstr("All progress was lost when canceled/error",
            "ความคืบหน้าหายถ้ากดยกเลิก/เกิดข้อผิดพลาด")
  ]
]

#slide[
  #toolbox.register-section(mstr("\"Recoverable\" Training", "เทรนโมเดลโดยไม่ล่ม"))

  #align(horizon + center)[
    #mstr("Optional: recoverable training by adding checkpoints",
          "คะแนนพิเศษ: เทรนโมเดลโดยใช้ checkpoint")

    #set text(size: 0.6em)
    #mstr("(ChatGPT allowed) Complete two methods:",
          "(ใช้ ChatGPT ได้) เขียน 2 methods:")

    #mstr("load model checkpoints if exists",
          "โหลดโมเดลจาก checkpoint ถ้ามี"),
    #mstr("save the model for each training epoch",
          "บันทึกโมเดลทุก ๆ training epoch")
  ]
]

#slide[
  #toolbox.register-section(mstr("Conclusion", "สรุป"))

  == #mstr("Conclusion", "สรุปจบ")

  - LiCO -> Slurm -> Script -> GPU
  - #mstr("PyTorch is the leader, CUDA is the key",
          "PyTorch เท่านั้น CUDA คือกุญแจสำคัญ")
  - #mstr("Use it while it lasts for free",
          "โปรดใช้ในขณะที่ยังมีให้ใช้ฟรี")
  - #mstr("User will be deleted tomorrow.",
          "User จะถูกลบในวันพรุ่งนี้")
  - #mstr("Questions are welcomed",
          "สงสัยถามได้")
]
