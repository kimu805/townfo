function read() {
  const noticeItems = document.querySelectorAll(".notice_item");
  const readNotices = new Set(); // 既読済みの通知を追跡するセット

  if ("IntersectionObserver" in window) {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        // 100%表示されたとき (threshold: 1.0)
        if (entry.isIntersecting && entry.intersectionRatio === 1) {
          const noticeId = entry.target.dataset.noticeId;

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
  fetch(`/notices/${noticeId}/mark_as_read`, {
    method: 'PATCH',
    headers: {
      'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ read: true })
  }).then((response) => {
    if (!response.ok) {
      console.error("既読情報の送信に失敗しました");
    }
  });
}
window.addEventListener("turbo:load", read)