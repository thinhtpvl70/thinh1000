<?php
include 'connect.php';
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js'></script>
</head>
<body background="https://indainam.com/wp-content/uploads/2017/10/mau-background-don-gian-02-768x576.jpg">
	<div class="header">
		<div class="element header1">
			<span class="logo">
				<img src="images/logo.jfif" alt="logo">
			</span>
			<span class="menu">
				<ul>
					<li><a href="trangchu.php">Trang Chủ</a></li>
					<li><a href="#">Giày Bóng Đá</a></li>
					<li><a href="#">Tin Tức</a></li>
					<li><a href="#">Hãng Giày Bóng Đá</a></li>
					<li><a>
						<form action="index.php" method="post" enctype="multipart/form-data">
							<span>
							<input type="text"name="txttimkiem" value="" placeholder="Tìm kiếm sản phẩm gì"><br>
							</span>
							<span><input type="submit"  value="Tìm kiếm" name="btntimkiem"></span>
						  </form>
						</a>
				    </li>
					<li><a href="login.php">Đăng Nhập</a></li>
				  </ul>
			</span>
		</div>
		<div class="clearfix"></div>

	</div>
	<!-- --close  header-->
	<div class="content">
		<div class="element title">
			<div class="slideshow">
				<div class="slides">
					<input type="radio" name="bottom" id="bottom1" checked>
					<input type="radio" name="bottom" id="bottom2">
					<input type="radio" name="bottom" id="bottom3">
					<div class="slide s1">
						<img src="images/image1.jpg">
					</div>
					<div class="slide">
						<img src="images/image2.jpg">
					</div>
					<div class="slide">
						<img src="images/image3.jpg">
					</div>
				</div>
				<div class="navigation">
					<label for="bottom1" class="bar"></label>
					<label for="bottom2" class="bar"></label>
					<label for="bottom3" class="bar"></label>
				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="clearfix"></div>
		<div class="element main">
		<?php 
			$stm= $o->query('select * from product');
			$data = $stm->fetchAll();
			$n = $stm->rowCount();
			// echo "<h1>Co $n cuon sach </h1>";
			?>
			<style>
				div.sp{width: 200px; height: 100px;  float: left;margin: 100px;}
			</style>
			<?php
			foreach ($data as $key => $value) {
				?>
			<div class="sp">
				<img src="./<?php echo $value['image']?>" style="width:75%"/> <br>
				<?php echo $value['name'];?> <br>
				Gia 
				<?php echo number_format($value['price']) ?> VNĐ <br>
				<a href="qlcart.php?action=them&id=<?php echo $value['id'] ?>">Mua sản phẩm</a>
			</div>
				<?php
			}
		?>
		</div>
	</div>
	<!-- --close  element-->
	<div class="clearfix"></div>
	<div class="footer">
		<h1>Shop Giày Bóng Đá</h1>
        <h3>Chủ shop: Thịnh Thanh</h3>
		<h3>Liên hệ sdt: 01884475616 hoặc gmail:kaitoukid@gmail.com</h3>
		<h3>Địa chỉ: 55 Hòa Bình, P. Tân Thới Hòa, Q. Tân Phú, TP. Hồ Chí Minh.</h3>
	</div>
</body>
<script>
jQuery(document).ready(function() {
var offset = 220;
var duration = 500;
jQuery(window).scroll(function() {
if (jQuery(this).scrollTop() > offset) {
jQuery('.back-to-top').fadeIn(duration);} else {
jQuery('.back-to-top').fadeOut(duration);}});
jQuery('.back-to-top').click(function(event) {
event.preventDefault();
jQuery('html, body').animate({scrollTop: 0}, duration);
return false;})});</script>
<style>
div#page {
max-width: 900px;
margin-left: auto;
margin-right: auto;
padding: 20px;}
.back-to-top {
position: fixed;
bottom: 2em;
right: 0px;
text-decoration: none;
color: #000000;
background-color: rgba(235, 235, 235, 0.80);
font-size: 12px;
padding: 1em;
display: none;}
.back-to-top:hover {
text-decoration: none;}</style>
<a href="#" class="back-to-top"><img src="https://thenaynhe.com/wp-content/uploads/2019/09/them-nut-len-dau-trang-back-to-top-button-63-2.jpg" alt="Back to Top" /></a>
<?php
	if (isset($_POST['btntimkiem'])) {
		$datatk = $_POST['txttimkiem'];
		$query = "SELECT product.name, product.image, product.price FROM product WHERE product.name LIKE '%$datatk%'";
		$stm = $o->prepare($query);
		if ($stm->execute()) {
			while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {?>
				<tr>
					<td><img src="./<?php echo $row['image'] ?>" width="100" height="100" /></td><br>
					<td><?php echo $row['name'] ?></td><br>
					<td><?php echo  $row['price'] ?></td>
				</tr>
				<?php
			}
		}
	}
else{
	echo "Khong tim thay";
}
?>
</html>
<!-- background-color: #71F95F; -->
<!-- echo  $row['HinhAnh'] . '<br/>' .  $row['Ten_SP'] . '<br/>' .  $row['gia']; -->