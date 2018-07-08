'use strict';

(function() {

    setTimeout(openModalWindow, 1500);

    function openModalWindow(e) {
        var child = document.createElement('div');
            child.className = "inside";
        var text = document.createElement('h1');
            text.className = "inside-text";
            text.innerHTML = "2018 devICT Salary Survey</h1><p>As part of an effort to better understand the software development ecosystem in Wichita, devICT is conducting a salary survey.</p><h2><a class=modal-link target=_blank href=https://kentonh.typeform.com/to/SNdj46>Please Participate >>>></a>";
        child.appendChild(text);

        //create modal instance and pass in child elements
            //can be whatever, styled however you want
        var modal = new Modal(child, true);
        modal.show(); //open the modal window
    }

})();
