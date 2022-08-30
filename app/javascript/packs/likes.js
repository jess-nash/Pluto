let buttons = document.querySelectorAll(".likes");
for (const button of buttons) {
  button.onclick = function() {
    if (button.classList.contains('fa-regular')) {
      button.classList.remove('fa-regular')
      button.classList.add('fa-solid')
    } else {
      button.classList.remove('fa-solid')
      button.classList.add('fa-regular')
    }
  };
}
