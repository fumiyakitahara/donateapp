function comment() {
  const submit = document.getElementById("submit");
  const posts = document.getElementById("comment");
  const name = document.getElementById("comment-name");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    const supportId = posts.getAttribute("data-id");
    XHR.open("POST", `/supports/${supportId}/comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.comment;
      const user  = XHR.response.user;
      const list = document.getElementById("list");
      const formText = document.getElementById("content");
      const HTML = `
        <div class = "comment" data-id =${supportId}  id="comment">
          <strong>${user.last_name }さん：</strong>
          ${item.content}
        </div>
        `;
      list.insertAdjacentHTML("afterend", HTML);
      formText.value = "";
    };
    e.preventDefault();
  });
}

window.addEventListener("load", comment);
