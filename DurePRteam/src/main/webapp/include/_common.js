/**
 * 
 */
 
$(function () {
	//Date picker	
    $('.dateYYYYMM').datetimepicker({
    	locale: 'ko',
       	format: 'YYYY-MM',
    });	
    $('.dateYYYYMMDD').datetimepicker({
    	locale: 'ko',
       	format: 'YYYY-MM-DD'
    });    
    $(".dateYYYYMMDD").on('hide.datetimepicker', function (ev, picker) {
    	//console.log('ev', new Date(ev.date._i).getDay());
    	// 달력 선택 시 요일 초기화	
    	var weekday = getWeekday(ev.date._i);
    	$('[name=pDay]').val(weekday);
    });
    
    // Table
	$("[data-url]").click(function() {
	    var url = $(this).attr("data-url");
	    location.href = url;
	});
	$("[data-confirm-delete]").click(function() {
	  return confirm("삭제하시겠습니까?");
	});

});

// 요일리턴
function getWeekday(strDay) {
	var day = new Date(strDay).getDay();
	var weekdays = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"]; 
	var weekday = weekdays[day]; 
	return weekday;
}