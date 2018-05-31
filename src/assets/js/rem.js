(function (doc, win) {
    let docEl = doc.documentElement
    let resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize'
    let recalc = function () {
        let clientWidth = docEl.clientWidth
        if(clientWidth>750){
            clientWidth=750
        }
        if (!clientWidth) return
        docEl.style.fontSize = 100 * (clientWidth / 750) + 'px';
        console.log('--', docEl.style.fontSize)
    }
    if (!doc.addEventListener) return
    win.addEventListener(resizeEvt, recalc, false)
    doc.addEventListener('DOMContentLoaded', recalc, false)
})(document, window)