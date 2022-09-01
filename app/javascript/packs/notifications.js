let notifs = document.querySelectorAll(".notification");
for (const notif of notifs) {
  notif.onclick = function() {
    if (notif.classList.contains('on')) {
      notif.classList.remove('on')
      notif.classList.add('off')
    }
  };
}
