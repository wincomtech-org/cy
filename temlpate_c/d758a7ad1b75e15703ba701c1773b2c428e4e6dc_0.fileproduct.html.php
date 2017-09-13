<?php
/* Smarty version 3.1.30, created on 2017-09-13 16:38:20
  from "D:\phpStudy\WWW\GitHub\cy\theme\en_us\product.html" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_59b8ee7c724770_48596851',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'd758a7ad1b75e15703ba701c1773b2c428e4e6dc' => 
    array (
      0 => 'D:\\phpStudy\\WWW\\GitHub\\cy\\theme\\en_us\\product.html',
      1 => 1505291899,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:inc/header.tpl' => 1,
    'file:inc/footer.tpl' => 1,
  ),
),false)) {
function content_59b8ee7c724770_48596851 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_subTemplateRender("file:inc/header.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

<link rel="stylesheet" href="http://tx.ext2/theme/en_us/css/main.css">
<!--主题内容-->
<div class="main-body">
	<!-- 产品详情页 -->
	<div class="about">
		<div  class="about_content">
			<!--标题-->
			<div class="about_content_tit">
				<div class="about_conTit_div">
					<h3><span><?php echo $_smarty_tpl->tpl_vars['product']->value['name'];?>
</span></h3>		
				</div>		
			</div>
			<!--内容-->
			<div class="prodcts_detail_content ">
				<div class="prodcts_detail_tit notes_img">
					<div class="img">
						<a href="javascript:void(0);"><img src="<?php echo $_smarty_tpl->tpl_vars['product']->value['thumb'];?>
" alt=""></a>
					</div>
					<div class="txt">
						<h6>Summary:</h6>
						<p><?php echo $_smarty_tpl->tpl_vars['product']->value['description'];?>
</p>
					</div>
					<div class="notes">
							<div class="notes_con">
								<a href="<?php echo $_smarty_tpl->tpl_vars['url']->value['guestbook'];?>
">
									<span class="txt">Contact Us</span>
									<span class="img"><img src="http://tx.ext2/theme/en_us/img/iphone.png" alt=""></span>
								</a>
							</div>
						</div>
					<div class="clear"></div>
				</div>

				<div class="products_standard mg-t-30n pad-b-30 pad-t-30">
					<div class="about_content_tit unline">
						<div class="about_conTit_div">
							<h3><span>Standard</span></h3>		
						</div>		
					</div>
					<?php if ($_smarty_tpl->tpl_vars['defined']->value) {?>
					<table style="table-layout:fixed;">
						<thead>
							<tr>
								<th style='width:40%'>Attr.Name</th>
								<th style='width:60%'>Attr.Value</th>
							</tr>
						</thead>
						<tbody>
							<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['defined']->value, 'd');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['d']->value) {
?>
							<tr>
								<td><?php echo $_smarty_tpl->tpl_vars['d']->value['dkey'];?>
</td>
								<td colspan="2"><?php echo $_smarty_tpl->tpl_vars['d']->value['dval'];?>
</td>
							</tr>
							<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

						</tbody>
					</table>
					<?php } else { ?>
						<div class="no_source">No Resource ……</div>
					<?php }?>
					<form action="order.php?rec=insert" method="post" accept-charset="<?php echo $_smarty_tpl->tpl_vars['site']->value['dou_charset'];?>
">
						<input type="hidden" name="product_id" value="<?php echo $_smarty_tpl->tpl_vars['product']->value['id'];?>
">
						<input type="hidden" name="number" value="1">
						<p><input class="btn-view-red" type="submit" value="Add To Cart"></p>
					</form>
				</div>

				<div class="no_source"><?php echo $_smarty_tpl->tpl_vars['product']->value['content'];?>
</div>
			</div>
		</div>		
	</div>	
	<?php $_smarty_tpl->_subTemplateRender("file:inc/footer.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

</div>	
<?php echo '<script'; ?>
 src="http://tx.ext2/theme/en_us/js/easySlider.min.js"><?php echo '</script'; ?>
>
<?php }
}
