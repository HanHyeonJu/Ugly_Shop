(function (path) {
  // 수정버튼 클릭시 => 업데이트 모달창 생성
  $('.btn-update').click(function (e) {
    const $modal = $('#modal-update');
    $modal.find('form').attr('action', path + '/managerProduct?cmd=update');

    e.preventDefault(); //submit 동작 중지
    e.stopPropagation(); //이벤트 중지
    $('.btn-action').prop('disabled', true); //모달창 닫기중지

    $.ajax({
      type: 'POST',
      url: path + '/managerProduct?cmd=edit', // edit으로 보내기
      data: 'prodID=' + $(this).data('id'),
      dataType: 'json', //받을때 타입
    })
      .done(function (data) {
        if (data.status) {
          //요청결과를 성공적으로 받으면 모달창을 채워넣음
          $('#farmID').val(data.product.farmID);
          $('#prodName').val(data.product.prodName);
          $('#prodImg').val(data.product.prodImg);
          $('#prodPrice').val(data.product.prodPrice);
          $('#prodInfo').val(data.product.prodInfo);
          $('#prodInven').val(data.product.prodInven);

          // 히든타입의 id 입력창을 넣는다 이때 id도 입력됨
          $modal.find('form').append('<input type="hidden" name="prodID" value="' + data.product.prodID + '">');

          $modal.modal('show');
        }
      })
      .fail(function (jqXHR, textStatus) {
        // 실패했을때
        console.log(textStatus);
      });
  });
  // 수정 모달창의 form의 submit(저장)버튼을 눌렀을때
  $('#update').submit(function (e) {
    e.preventDefault(); //submit 동작 중지
    e.stopPropagation(); //이벤트 중지
    $('.btn-action').prop('disabled', true); //모달창 닫기중지

    $.ajax({
      type: 'POST',
      url: $('#update').attr('action'),
      data: $('#update').serialize(), //form의 입력한 내용을 문자열로 변환
      dataType: 'json', //받을때 타입
    }).done(function (data) {
      console.log(data);
      if (data.status) {
        //요청결과를 성공적으로 받음
        $('#modal-update').modal('hide'); //닫기
        location.reload(); //새로고침
      }
    });
  });

  // 삭제버튼 클릭시 => 삭제 모달창 생성
  $('.btn-delete').click(function (e) {
    $('#frm-delete').find('input[name=prodID]').val($(this).data('id'));
  });
  // 삭제 모달창의 form의 submit(삭제)버튼을 눌렀을때
  $('#frm-delete').submit(function (e) {
    e.preventDefault(); //submit 동작 중지
    e.stopPropagation(); //이벤트 중지
    $('.btn-action').prop('disabled', true); //모달창 닫기중지

    $.ajax({
      type: 'POST',
      url: path + '/managerProduct?cmd=delete', // 삭제하기 창
      data: $('#frm-delete').serialize(), //폼태그 입력 내용을 문자열로 변환
      dataType: 'json', //받을때 타입
    })
      .done(function (data) {
        if (data.status) {
          //요청결과를 성공적으로 삭제함
          $('#modal-delete').modal('hide'); // 닫기
          location.href = path + '/managerProduct?cmd=list'; //농산품페이지로이동
        }
      })
      .fail(function (jqXHR, textStatus) {
        // 실패했을때
        console.log(textStatus);
      });
  });
})(path);
