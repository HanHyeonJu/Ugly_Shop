(function (path) {
  // 영문 -> 한글, 페이지 설정
  $('.table').DataTable({
    language: {
      lengthMenu: '표시할 줄수 선택    _MENU_',
      search: '검색',
      paginate: { previous: '이전', next: '다음' },
      info: '페이지 _PAGE_ / _PAGES_',
      infoEmpty: '데이터가 없습니다.',
      infoFiltered: '(전체 페이지 _MAX_ 에서 검색)',
      thousands: ',',
    },
    lengthMenu: [4, 8], // 한 페이지에 표시할 행 수
    pageLength: 4, // 한번에 보여줄 페이지 갯수
    ordering: false, // 정렬옵션 off
    stateSave: true,
  });
})(path);
