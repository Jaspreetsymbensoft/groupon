<?php
	require_once("config.php");
	$client_id	= "client_id=56776241f7f2ce38fce353cb2d2982189ff021ca";
	$url = "https://api.groupon.com/v2/divisions.json?$client_id";
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_URL,$url);
	$result=curl_exec($ch);
	$josndata	= json_decode($result, true);
	foreach($josndata['divisions'] as $data){
		$set	= "";
		$keys	= "";
		$divisions	= "";
		foreach($data as $keys => $divisions){
			if($keys == "areas"){
				if(isset($divisions[0])){
					for($a=0; $a<count($divisions); $a++){
						if(mysql_num_rows(mysql_query("SELECT id FROM areas WHERE id='".$divisions[$a]['id']."'")) == 0){
							$are	= "";
							$are[]	= "divisionid = '".mysql_real_escape_string($divisions[$a]['id'])."'";
							foreach($divisions[$a] as $dke => $dva){
								$are[]	= "$dke = '".mysql_real_escape_string($dva)."'";
							}
							mysql_query("INSERT INTO areas SET ".implode(", ", $are));
						}
						foreach($divisions[$a] as $dkey => $dval){
							$areas[]	= "$dkey:$dval";
						}
						$area[]	= implode(",", $areas);
					}
					$set[]	= "$keys = '".mysql_real_escape_string(implode("~", $area))."'";
				}
			}else{
				$set[]	= "$keys = '".mysql_real_escape_string($divisions)."'";
			}
		}
		if(mysql_num_rows(mysql_query("SELECT id FROM division WHERE id='".$data['id']."'")) == 0){
			mysql_query("INSERT INTO division SET ".implode(", ", $set));
		}
		$division	= $data['id'];
		$urla = "https://api.groupon.com/v2/deals?division_id=$division&$client_id";
		$cha = curl_init();
		curl_setopt($cha, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($cha, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($cha, CURLOPT_URL,$urla);
		$resulta	= curl_exec($cha);
		$josndat	= json_decode($resulta, true);
		foreach($josndat['deals'] as $deals){
			$deal	= "";
			$deal[]	= "divisionid = '".mysql_real_escape_string($division)."'";
			foreach($deals as $dkey => $ddata){
				if(is_array($ddata)){
					$deal[]	= "$dkey = '".mysql_real_escape_string(serialize($ddata))."'";
				}else{
					$deal[]	= "$dkey = '".mysql_real_escape_string($ddata)."'";
				}
			}
			if(mysql_num_rows(mysql_query("SELECT id FROM divisiondeals WHERE divisionid='".mysql_real_escape_string($division)."' && dealsid='".mysql_real_escape_string($deals['id'])."'")) == 0){
				mysql_query("INSERT INTO divisiondeals SET divisionid='".mysql_real_escape_string($division)."', dealsid='".mysql_real_escape_string($deals['id'])."'")or die(mysql_error());
			}
			if(mysql_num_rows(mysql_query("SELECT id FROM deals WHERE id='".$deals['id']."'")) == 0){
				mysql_query("INSERT INTO deals SET ".implode(", ", $deal))or die(mysql_error());
			}
			if(isset($deals['options'][0]['redemptionLocations'][0])){
				foreach($deals['options'][0]['redemptionLocations'] as $dld){
					$dl	= "";
					$dl[]	= "dealsid='".mysql_real_escape_string($deals['id'])."'";
					foreach($dld as $dlkey => $dlval){
						$dl[]	= "$dlkey = '".mysql_real_escape_string($dlval)."'";
					}
					if(mysql_num_rows(mysql_query("SELECT id FROM dealslocation WHERE id='".$dld['id']."'")) == 0){
						mysql_query("INSERT INTO dealslocation SET ".implode(", ", $dl))or die(mysql_error());
					}
				}
			}
		}
		// echo "<a href='?division=".$data['id']."' >".$data['name']."</a><br />";
	}
?>
