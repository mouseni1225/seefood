$(function(){
  // 先取得 #abgne-110223 及 ul, li 及 .caption 元素
  // 並預設先顯示第幾個, 還有動畫速度
  var $block = $('#abgne-110223'), 
    $wrap = $block.find('.wrap-110223'), 
    $ul = $wrap.find('ul'), 
    $li = $ul.find('li'), 
    $caption = $block.find('.caption'), 
    _default = 0, 
    _width = $wrap.width(), 
    animateSpeed = 400;
 
  // 先把 ul 的寬度設成 li 數量 x $wrap 的寬
  $ul.width(_width * $li.length);
  // 如果 .arrows 中的 a 被點擊時
  $block.find('.arrows').delegate('a', 'click', function(event){
    // 先找出 .selected 的元素後移掉該樣式
    var $selected = $li.filter('.selected').removeClass('selected'), 
      // 找出目前顯示的元素是第幾個
      _index = $li.index($selected);
 
    // 依點擊的是上一張或下一張來切換
    _index = (event.target.className == 'prev' ? _index - 1 + $li.length : _index + 1) % $li.length;
    $ul.animate({
      left: _index * _width * -1
    }, animateSpeed);
    // 改變標題
    $caption.hide().html($li.eq(_index).addClass('selected').find('img').attr('alt')).fadeIn(animateSpeed);
 
    return false;
  });
 
  // 先顯示預設的
  $ul.css('left', _default * _width * -1);
  $caption.html($li.eq(_default).addClass('selected').find('img').attr('alt'));
 
  $block.find('a').focus(function(){
    this.blur();
  });
});$(function(){
  // 先取得 #abgne-110223 及 ul, li 及 .caption 元素
  // 並預設先顯示第幾個, 還有動畫速度
  var $block = $('#abgne-110223'), 
    $wrap = $block.find('.wrap-110223'), 
    $ul = $wrap.find('ul'), 
    $li = $ul.find('li'), 
    $caption = $block.find('.caption'), 
    _default = 0, 
    _width = $wrap.width(), 
    animateSpeed = 400;
 
  // 先把 ul 的寬度設成 li 數量 x $wrap 的寬
  $ul.width(_width * $li.length);
  // 如果 .arrows 中的 a 被點擊時
  $block.find('.arrows').delegate('a', 'click', function(event){
    // 先找出 .selected 的元素後移掉該樣式
    var $selected = $li.filter('.selected').removeClass('selected'), 
      // 找出目前顯示的元素是第幾個
      _index = $li.index($selected);
 
    // 依點擊的是上一張或下一張來切換
    _index = (event.target.className == 'prev' ? _index - 1 + $li.length : _index + 1) % $li.length;
    $ul.animate({
      left: _index * _width * -1
    }, animateSpeed);
    // 改變標題
    $caption.hide().html($li.eq(_index).addClass('selected').find('img').attr('alt')).fadeIn(animateSpeed);
 
    return false;
  });
 
  // 先顯示預設的
  $ul.css('left', _default * _width * -1);
  $caption.html($li.eq(_default).addClass('selected').find('img').attr('alt'));
 
  $block.find('a').focus(function(){
    this.blur();
  });
});