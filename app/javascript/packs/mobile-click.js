const showCircle = (cursor, seconds) => {
  // console.log(cursor);
  const circle = document.createElement("div");
  circle.style.position = "fixed";
  circle.style.backgroundColor = "grey";
  circle.style.borderRadius = "50%";
  circle.style.left = `${cursor.clientX - 16}px`;
  circle.style.top = `${cursor.clientY - 16}px`;
  circle.style.height = "32px";
  circle.style.width = "32px";
  circle.style.opacity = 0.8;
  document.body.appendChild(circle);
  setTimeout(() => {
     circle.remove();
  }, seconds * 500);
};

document.addEventListener("touchmove", (event) => {
  showCircle(event.targetTouches[0], 0.1);
});
document.addEventListener("click", (event) => {
  showCircle(event, 1);
});
