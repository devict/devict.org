
'use strict';

(function() {

    setTimeout(openModalWindow, 1500);

    function openModalWindow(e) {
        var child = document.createElement('div');
        child.className = "inside";
        child.innerHTML = `
            <h1 class="inside-text">2018 devICT Salary Survey</h1>
            <hr>
            <p class="lead">
                As part of an effort to better understand and improve the software
                development ecosystem in Wichita, devICT is conducting a salary
                survey. The information provided will remain anonymous.
            </p>
            <h2>
                <a class="btn btn-lg btn-success survey-modal-link" target="_blank" href="https://kentonh.typeform.com/to/SNdj46">
                    Individuals Participate >>>>
                </a>
                <a class="btn btn-lg btn-success survey-modal-link" target="_blank" href="https://form.jotform.com/81908941084160">Employers Participate >>>></a>

            </h2>
        `;

        //create modal instance and pass in child elements
        //can be whatever, styled however you want
        var modal = new Modal(child, true);
        modal.show(); //open the modal window
    }

})();
