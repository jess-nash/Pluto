const seeMore = document.querySelector('.see-more');
const moreText = document.querySelector('.more-text');

seeMore.addEventListener('click', () => {
  if (moreText.style.display === "none") {
    seeMore.style.display = "none";
    moreText.style.display = "inline";
  } else {
    moreText.style.display = "none";
  }
});
