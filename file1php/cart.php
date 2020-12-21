<?php
include 'connect.php';
if (!isset($_SESSION)) session_start();
$tam = isset($_SESSION['cart']) ? $_SESSION['cart'] : [];
?>
<a href="index.php">Tiếp tục mua hàng</a>
<hr>
<h1>Giỏ hàng</h1>
<table border="1">
	<tr>
		<td>STT</td>
		<td>Tên Sản phẩm</td>
		<td>Hình Ảnh</td>
		<td>Giá</td>
		<td>Số Lượng</td>
		<td>Thành Tiền</td>
		<td>Thao Tác</td>
	</tr>
	<?php
	$i = 0;
	foreach ($tam as $key => $value) {
		$sql = "SELECT * FROM `product` where id='{$key}'";
		$stm = $o->query($sql);
		$stm = $o->prepare($sql);
		// $data = $stm->fetch();
		$stm->execute();
		$i++;

		while ($data = $stm->fetch(PDO::FETCH_ASSOC)) { ?>
			<tr>
				<td><?php echo $i ?></td>
				<!-- <td><?php $key ?></td> -->
				<td><?php echo $data['name'] ?></td>
				<td><img src="./<?php echo $data['image'] ?>" style="width:100px; height=100px;" /></td>
				<td><?php echo  $data['price'] ?></td>
				<td><?php echo $value ?></td>
				<td><?php echo $value * $data['price'] ?></td>
				<td>
					<a href="qlcart.php?action=xoa&id=<?php echo $key ?>">Xoa</a>
				</td>
			</tr>
		<?php
		}
		?>
	<?php
	}
	?>

</table>
<style>
	div.tool label {
		width: 100px;
		display: inline-block;
		margin-top: 15px;
	}

	div.tool textarea {
		margin-top: 15px;
	}

	div.tool input {
		line-height: 30px;
		height: 30px;
	}

	input[name="order_click"] {
		margin-top: 15px;
	}

	/* div.form-button{text-align: right; margin-right: 1000px; margin-top: 15px;} */
</style>
<!-- <div class="form-button">
    <input type="submit" name="update_click" value="Cập nhật" />
</div> -->
<hr>
<form action="cart.php" method="POST">
	<div class="tool"><label>Người nhận: </label><input type="text"  name="name" /></div>
	<div class="tool"><label>Điện thoại: </label><input type="text"  name="phone" /></div>
	<div class="tool"><label>Địa chỉ: </label><input type="text"  name="address" /></div>
	<div class="tool"><label>Ghi chú: </label><textarea name="note" cols="50" rows="7"></textarea></div>

	<input type="submit" name="order_click" value="Đặt hàng" />
</form>
<?php
include 'connect.php';
if (isset($_POST['order_click'])) { //Đặt hàng sản phẩm
	$tennguoinhan = addslashes($_POST['name']);
	$sdt = addslashes($_POST['phone']);
	$diachi = addslashes($_POST['address']);
	$note = addslashes($_POST['note']);
	$query = "INSERT INTO `order` Values(NULL, '$tennguoinhan', '$sdt', '$diachi', '$note' ,'9000000','12092020','12092020')";
	$stm = $o->prepare($query);
	$stm->execute();
	echo "Đặt hàng thành công";
	//unset($_SESSION['cart']);
	// if ($error == false && !empty($_POST['quantity'])) { //Xử lý lưu giỏ hàng vào db
	// 	$products = $o->query ("SELECT * FROM `sanpham` WHERE `id` IN (" . implode(",", array_keys($_POST['quantity'])) . ")");
	// 	$stm = $o->prepare($products);
	// 	$stm->execute();
	// 	$total = 0;
	// 	$orderProducts = array();
	// 	while ($row = $stm->fetch(PDO::FETCH_ASSOC)) {
	// 		$orderProducts[] = $row;
	// 		$total += $row['gia'] * $_POST['quantity'][$row['id']];
	// 	}
	// 	$insertOrder = $o->query("INSERT INTO `hoadon` (`id`, `TenNguoiNhan`, `phone`, `DiaChiNguoiNhan`, `note`, `total`, `ngay_tao`, `ngay_capnhap`) VALUES (NULL, '" . $_POST['TenNguoiNhan'] . "', '" . $_POST['phone'] . "', '" . $_POST['DiaChiNguoiNhan'] . "', '" . $_POST['note'] . "', '" . $total . "', '" . time() . "', '" . time() . "');");
	// 	$orderID = $o->insert_id;
	// 	$insertString = "";
	// 	foreach ($orderProducts as $key => $product) {
	// 		$insertString .= "(NULL, '" . $orderID . "', '" . $product['id'] . "', '" . $_POST['soluong'][$product['id']] . "', '" . $product['gia'] . "', '" . time() . "', '" . time() . "')";
	// 		if ($key != count($orderProducts) - 1) {
	// 			$insertString .= ",";
	// 		}
	// 	}
	// 	$insertOrder = $o->query("INSERT INTO `chitiet_hoadon` (`id`, `id_hoadon`, `id_sanpham`, `soluong`, `gia`, `ngay_tao`, `ngay_capnhap`) VALUES " . $insertString . ";");
	// 	$success = "Đặt hàng thành công";
	// 	unset($_SESSION['cart']);
	// }
}
?>