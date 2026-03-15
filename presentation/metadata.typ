#import "utils.typ": mstr

#let title = "LiCO H100 Cluster Kickstarter"
#let description = mstr(
  "A quick beginner guide using H100 Slurm Cluster on LiCO system platform",
  "เริ่มต้นใช้งาน H100 Slurm Cluster บน LiCO ขั้นเบื้องต้น",
)
#let author = context {
  if text.lang == "th" { link("https://napatsc.com/th")[ณภัทร ศรีจันทร์] }
  else { link("https://napatsc.com")[Napat Srichan] }
}
#let date = datetime(year: 2026, month: 3, day: 15)
#let institution = link("https://computing.kku.ac.th")[#mstr(
    "College of Computing, Khon Kaen University",
    "วิทยาลัยการคอมพิวเตอร์ มหาวิทยาลัยขอนแก่น",
  )]
