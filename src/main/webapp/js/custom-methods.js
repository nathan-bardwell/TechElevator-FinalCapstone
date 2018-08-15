document.addEventListener('DOMContentLoaded', () => {
    let formToggler = document.getElementById('formToggler');
    formToggler.addEventListener('change', switchForms);
});

function switchForms(event) {
    let value = event.currentTarget.value;
    if(value == 'individual') {
        document.getElementById('individualHouseForm').style.display = "";
        document.getElementById('MultipleInput').style.display = "none";
    }
    if(value == 'csv') {
        document.getElementById('individualHouseForm').style.display = "none";
        document.getElementById('MultipleInput').style.display = "";
    }
}