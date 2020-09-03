<?php
	$koneksi = @mysqli_connect("localhost","root","");
	$database = mysqli_select_db($koneksi,"loadimage");=
	
	function milliseconds() {
		$mt = explode(' ', microtime());
		return ((int)$mt[1]) * 1000 + ((int)round($mt[0] * 1000));
	}
	
	$tg = date(' l, d M Y H:i:s');
	$tgl = date('Y-m-d H:i:s', strtotime('+7 hours',strtotime($tg)));
	$kd = date('YmdHis', strtotime('+7 hours',strtotime($tg)));
    
    //http://localhost/appru/API/SampleLoadImg/APIImg.php?key=apiapi&act==
    
	$respon = array(); 
	$keyAkses = 'apiapi';
	
	$key = $_GET['key'];
	$act = $_GET['act'];
	
	if ($key == $keyAkses){
		$index = 0;
		if (!$koneksi) {
			$respon[$index]['result'] = 'null';
		} else {
			if ($act=='loadDataImg'){ 
				$SQLAdd = 
					"SELECT * FROM listimage ORDER BY RAND() ASC";

				$query = mysqli_query($koneksi, $SQLAdd);

				if (mysqli_num_rows($query) > 0){
					while ($list = mysqli_fetch_array($query)) {
						$respon[$index]['id_img'] = $list['id_img'];  

						$index++;
					}
				} else {
					$respon[$index]['result'] = 'null';	
					$respon[$index]['pesan'] = 'MAAF, TIDAK ADA DATA';	
				}
			} elseif ($act=='loadImg') {
				#http://localhost/appru/API/SampleLoadImg/APIImg.php?key=apiapi&act=loadImg&id=1
				$id = $_GET['id'];
				$SQLAdd = 
					"SELECT temp FROM img
					WHERE id_img = '".$id."'
					ORDER BY id ASC";

				if ($query_img = mysqli_query($koneksi, $SQLAdd)) {
					$xx = '';
					if (mysqli_num_rows($query_img) > 0){
						$respon[$index]['result'] = "SUKSES";
	
						while ($list_img = mysqli_fetch_array($query_img)) {
							$xx = $xx.$list_img['temp'];   
						}
						$respon[$index]['temp'] = $xx;
					} else {
						$respon[$index]['result'] = 'null';
					}
				} else {
					$respon[$index]['result'] = 'null';
				}
			} else {
				$respon[$index]['result'] = "null";
			}
		}
	} else {
		$respon[$index]['result'] = 'null';
	}
	echo json_encode($respon,JSON_PRETTY_PRINT);
	?>