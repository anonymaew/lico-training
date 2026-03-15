#let date_to_string(dt:datetime) = context {
  let lang = text.lang
  let en_months = ("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December")
  let th_months = ("มกราคม","กุมภาพันธ์", "มีนาคม", "เมษายน","พฤษภาคม","มิถุนายน", "กรกฎาคม", "สิงหาคม", "กันยายน","ตุลาคม", "พฤศจิกายน","ธันวาคม")
  let months = en_months
  if lang == "th" {
    months = th_months
  }
  let month = months.at(dt.month() - 1)

  let day = str(dt.day())

  let year = str(dt.year())
  if lang == "th" {
    year = str(dt.year() + 543)
  }

  let result = day + " " + month + " " + year
  if lang == "en" {
    result = month + " " + day + ", " + year
  }
  result
}

#let mstr(default_content, th_content) = context {
  if text.lang == "th" {th_content}
  else {default_content}
}
