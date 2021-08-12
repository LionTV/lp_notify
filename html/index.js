$(function () {
    window.addEventListener('message', function(event) {
        var item = event.data;
        var millisec = item.seconds * 1000;
        if (item.type === "ui") {
            const content = $(`<div class="notification"><div class="notification-title">
                <p>` + item.title + `</p>
              </div>
              <p id="message">
                ` + item.message + `
              </p>
            </div>
            `)

            $("#notifications").prepend(content);

            setTimeout(() => {
                content.remove();
            },millisec)
        }
    })
})