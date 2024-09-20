function images() {
  const fileField = document.querySelector('input[type="file"][name="notice[images][]"]')
  if (!fileField) return null
  const imageLimits = 3
  
  const buildPreviewImage = (dataIndex, blob) => {
    const previews = document.querySelector(".notice_image_previews")

    const preview = document.createElement("div")
    preview.setAttribute("class", "preview")
    preview.setAttribute("data-index", dataIndex)

    const previewImage = document.createElement("img")
    previewImage.setAttribute("class", "preview_image")
    previewImage.setAttribute("src", blob)

    const deleteButton = document.createElement("div")
    deleteButton.setAttribute("class", "notice_previewImage_deleteButton redButton")
    deleteButton.innerHTML = "削除"
    deleteButton.addEventListener("click", () => deleteImage(dataIndex))

    preview.appendChild(previewImage)
    preview.appendChild(deleteButton)
    previews.appendChild(preview)
  }

  const deleteImage = (dataIndex) => {
    const deletePreviewImage = document.querySelector(`.preview[data-index="${dataIndex}"]`)
    deletePreviewImage.remove()
    const deleteFileField = document.querySelector(`input[type="file"][data-index="${dataIndex}"]`)
    deleteFileField.remove()
    
    const imageCount = document.querySelectorAll(".preview").length
    if (imageCount == imageLimits - 1) buildNewFileField()
  }

  const buildNewFileField = () => {
    const lastFileField = document.querySelector('input[type="file"][name="notice[images][]"]:last-of-type')
    const nextDataIndex = Number(lastFileField.getAttribute("data-index")) + 1

    const newFileFIeld = document.createElement("input")
    newFileFIeld.setAttribute("type", "file")
    newFileFIeld.setAttribute("name", "notice[images][]")
    newFileFIeld.setAttribute("class", "input-default")
    newFileFIeld.setAttribute("data-index", nextDataIndex)
    newFileFIeld.addEventListener("change", changeFileField)

    const fileFieldArea = document.querySelector(".images")
    fileFieldArea.appendChild(newFileFIeld)
  }

  const changeFileField = (e) => {
    const dataIndex = e.target.getAttribute("data-index")

    const file = e.target.files[0]
    if (!file) {
      deleteImage(dataIndex)
      return null
    }

    const blob = window.URL.createObjectURL(file)

    const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`)
    if (alreadyPreview) {
      const alreadyPreviewImage = alreadyPreview.querySelector("img")
      alreadyPreviewImage.setAttribute("src", blob)
      return null
    }
    
    buildPreviewImage(dataIndex, blob)

    const imageCount = document.querySelectorAll(".preview").length
    if (imageCount < imageLimits) buildNewFileField()
  }

  fileField.addEventListener("change", changeFileField)
}

window.addEventListener("turbo:load", images)