import jquery from "jquery"
window.$ = jquery;

$('.tab').on('click', function(event) {
  $('.active').removeClass('active');
  $(this).addClass('active');
  const index = $(this).index();
  $('.show').removeClass('show');
  $('.tabbox').eq(index).addClass('show');

  $.ajax({
    url: '/posts',
    type: 'GET',
    data: { status: $(this).text() },
    dataType: 'json',
    success: function(data) {
      const posts = data.posts;
      const posts_done = data.posts_done;
      let html = '';
      let html_done = '';
      posts.forEach(function(post) {
        html += '<li>' + post.title + '</li>';
      });
      posts_done.forEach(function(post) {
        html_done += '<li>' + post.title + '</li>';
      });
      $('.tabbox').eq(index).find('.show').html(html);
      $('.tabbox').eq(index).find('.show').html(html_done);
    },
    error: function(jqXHR, textStatus, errorThrown) {
      console.log(textStatus + ': ' + errorThrown);
    }
  });
});

