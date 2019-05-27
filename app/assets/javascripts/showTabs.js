function toggleDashboard {
  document.querySelectorAll('.tablinks').forEach ( function(element) {
    element.addEventListener("click", (event) => {
      document.querySelectorAll('.tablinks').forEach ( function(item) {
        item.classList.remove("active");
      });
      event.currentTarget.classList.add("active");
      document.querySelectorAll('.tabcontent').forEach (function(item) {
        item.style.display = "none";
      });
      document.getElementById(event.currentTarget.dataset.tab).style.display = "block";
    });
  });
};
