import consumer from "channels/consumer"

if (location.pathname.match(/\/notices\/\d/)) {

  consumer.subscriptions.create({
    channel: "CommentChannel",
    notice_id: location.pathname.match(/\d+/)[0]
  }, {
    
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
	    const html = `
        <div class= "noticeShow_comment_box">
          <div class= "noticeShow_comment_userNickname">
            ${data.user.nickname} ：
          </div>
          <div class= "noticeShow_comment_text">
            ${formatNewlines(data.comment.text)}
          </div>
        </div>
      `
      const comments = document.querySelector(".noticeShow_commentsIndex_box")
      comments.insertAdjacentHTML("beforeend", html)
      const commentForm = document.getElementById("comment_form")
      commentForm.reset()
    }
  });
}

function formatNewlines(text) {
  return text.replace(/\n/g, "<br>")
}