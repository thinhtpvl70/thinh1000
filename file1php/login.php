<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="style.css">
</head>
<body background="https://indainam.com/wp-content/uploads/2017/10/mau-background-don-gian-04-768x536.jpg">
    <div class="dangnhap">
        <div class="login-form">
            <form action="login.php" method="post">
                <h1>Đăng nhập vào Shop Bán Giày Bóng Đá</h1>
                <div class="input-box">
                    <input type="text" placeholder="Nhập username" name='txtUsername'>
                </div>
                <div class="input-box">
                    <input type="password" placeholder="Nhập mật khẩu" name='txtPassword'>
                </div>
                <div class="btn-box">
                    <table>
                        <tr>
                            <td>
                                <button type="submit" style="margin-left:299px;" name="dangnhap">
                                    Đăng nhập
                                </button>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
   </div>
</body>
<?php
session_start();
//Khai báo sử dụng session
include('connect.php');
//Xử lý đăng nhập
if (isset($_POST['dangnhap'])) 
{
    error_reporting(0);

    //Lấy dữ liệu nhập vào
    $username = addslashes($_POST['txtUsername']);
    $password = addslashes($_POST['txtPassword']);
     
    //Kiểm tra đã nhập đủ tên đăng nhập với mật khẩu chưa
    if (!$username || !$password) {
        echo "Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu. <a href='javascript: history.go(-1)'>Trở lại</a>";
        exit;
    }
     
    // mã hóa pasword
    $password = md5($password);
     
    //Kiểm tra tên đăng nhập có tồn tại không
    $query = "SELECT users.Email, users.MatKhau_Email FROM users WHERE users.Email ='$username' and users.MatKhau_Email='$password'";
    $stm = $o->prepare($query);
    $stm->execute();


    if ($stm->rowCount() == 0) {       
         header("Location login.php");
         echo "<script>
         alert('Dang nhap that bai');
          </script>";
    }else{
        $temp = $stm->fetch(PDO::FETCH_ASSOC);
        $_SESSION['username'] = $temp['Email'];
        header("Location: trangchu.php");
    } 
}
?>
</html>


