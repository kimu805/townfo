function read() {
  const noticeItems = document.querySelectorAll(".notice_item");
  const readNotices = new Set(); // 既読済みの通知を追跡するセット

  if ("IntersectionObserver" in window) {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        // 100%表示されたとき (threshold: 1.0)
        if (entry.isIntersecting && entry.intersectionRatio === 1) {
          const noticeId = entry.target.dataset.noticeId;
          const groupId = entry.target.dataset.groupId

          // 既読処理（表示された時点でサーバーにリクエストを送る）
          if (!readNotices.has(noticeId)) {
            markNoticeAsRead(noticeId);
            readNotices.add(noticeId); // 重複送信を防ぐためにセットに追加
          }
        }
      });
    }, { threshold: 1.0 }); // 100%表示されたときにイベントを発火

    noticeItems.forEach((item) => {
      observer.observe(item); // 各お知らせを監視
    });
  }
}

// 既読情報をサーバーに送信する関数
function markNoticeAsRead(noticeId) {
  fetch(`/reads`, {
    method: 'POST',
    headers: {
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ read: true, notice_id: noticeId })
  }).then((response) => {
    if (!response.ok) {
      console.error("既読情報の送信に失敗しました");
      return
    }
    return response.json()
  }).then((data) => {
    if (data && data.read_count !== undefined) {
      const noticeReadsElement = document.querySelector(`.notice_reads[data-notice-id= "${noticeId}"]`)
      if (noticeReadsElement) {
        noticeReadsElement.textContent = `既読：${data.read_count}`
      }
    }
  }).catch((error) => {
    console.log("エラーが発生しました", error)
  })
}
window.addEventListener("turbo:load", read)
window.addEventListener("turbo:render", read)
