const menuToggle = document.querySelector('.current-pet-icon')
const openedNav = document.querySelector('.nav-popout');
const shadowNav = document.querySelector('.shadow-nav');

menuToggle.addEventListener('click', () => {
  if (openedNav.style.display === "none") {
    openedNav.style.display = "block";
    shadowNav.style.display = "block";
  } else {
    openedNav.style.display = "none";
    shadowNav.style.display = "none";
  }
});

shadowNav.addEventListener('click', () => {
  if (openedNav.style.display = "block") {
    openedNav.style.display = "none";
    shadowNav.style.display = "none";
  }
});
