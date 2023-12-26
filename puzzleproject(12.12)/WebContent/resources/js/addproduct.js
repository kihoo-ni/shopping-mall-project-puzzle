
function validateNumberInput(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    
    // 입력된 키가 숫자가 아닌 경우
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        // 경고창 띄우기
        alert("숫자만 입력하세요.");
        return false;
    }
    return true;
}


