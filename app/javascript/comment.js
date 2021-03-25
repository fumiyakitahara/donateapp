function comment() {
  const submit = document.getElementById("submit");
  const posts = document.querySelectorAll(".comment");
  submit.addEventListener("click", (e) => {});
  const formData = new FormData(document.getElementById("form"));
  const XHR = new XMLHttpRequest();
  supportId = posts.getAttribute("data-id");
  XHR.open("POST", 'supports/${supportId}/comments', true);
  XHR.responseType = "json";
  XHR.send(formData);

}
window.addEventListener("load", comment);
