/**
 * 
 */
 
 console.log("Reply Module.....");
 
 const replyService = (function(){
 
 
 	function add(reply, callback,error){
 		console.log("add reply.....");
 		
 		$.ajax({
 			type: 'post',
 			url: '/replies/new',
 			data: JSON.stringify(reply),
 			contentType: "application/json; charset=utf-8",
 			success: function(result, status, xhr){
 				if(callback){
 					callback(result);
 				}
 			},
 			error: function(xhr, status, er){
 				if(error){
 					error(er);
 					}
 				}
 		})
 	} /* end of add*/
 	
 	function getList(param, callback, error){
 		console.log("callback : "+callback);
 		console.log("param : "+param);
 		const bno = param.bno;
 		const page = param.page || 1; /* param.page가 true이면  param.page 아니면 1*/
 		
 		/* $.getJSON(url, callback(함수).fail*/
 		$.getJSON("/replies/pages/" + bno + "/" + page, 
 			function(data){
 				if(callback){
 					// callback(data); 댓글의 목록만 가져오는 경우
 					callback(data.replyCnt, data.list); // 댓글의 갯수와 목록을 가져오는 경우
 				}
 			}
 		).fail(function(xhr, status, err){
 		
 			if(error){error(err) }
 			}
 		);
 	} /* end of getList*/
 			
 	function remove(rno, callback, error){
 		$.ajax({
 			type: 'delete',
 			url: '/replies/' + rno,
 			success: function(deleteResult, status, xhr){
	 			if(callback){
	 				callback(deleteResult);
	 			}
	 		}, /* success end*/
	 		error: function(xhr, status, er){
	 			if(error){
	 				error(er)
	 			}
	 		}
	 	}); /* ajax end*/ 
 	};/* remove end*/
 	
 	
 	
 	/* 콜백 함수: 완료될때 까지 기달린 후 작업 실행
 		해당 함수는 매개변수의 객체를 전달할 때 사용 하는 용도ㅣ*/
 	function update(reply, callback, error){
 		console.log(".....update  RNO :" + reply.rno);
 		
 		$.ajax({
 			type: "put",
 			url: '/replies/' + reply.rno,
 			data: JSON.stringify(reply),
 			contentType: "application/json; charset=utf-8",
 			success: function(result, status, xhr){
 				if(callback){
 					callback(result);
 				}
 			},
 			error: function(xhr, status, er){
 				if(error){
 					error(er);
 				}
 			}
 		});
 	}
 	
 	function get(rno, callback, error){
 		$.getJSON("/replies/" + rno, function(result){
 		 if(callback){callback(result);}
 		 }
 	).fail(function(xhr, status, err){
 		if(error){
 			error();}
 		});
 	}
 		
 	function displayTime(timeValue){
 	
 		const today = new Date();
		const gap = today.getTime() - timeValue;
		const dateObj = new Date(timeValue);
		
		if(gap < (1000*60*60*24)){
		
			const hhh = Math.floor(gap / (1000*60*60));
			const hh = dateObj.getHours().toString().padStart(2,'0');
			const mm = dateObj.getMinutes().toString().padStart(2,'0');
			const ss = dateObj.getSeconds().toString().padStart(2, '0');
			/*return hh + ":" +mm+ ":" + ss; */
			return hhh + " 시간 전";
		}else{
			const yy = dateObj.getFullYear().toString().padStart(2,'0');
			const MM = (dateObj.getMonth() + 1).toString().padStart(2,'0');
			const dd = dateObj.getDate().toString().padStart(2, '0');
			return yy+ "-" + MM + "-" + dd;
		}
		 		
 	}
 		
 	
 	return {add : add,
 	 		getList: getList, 
 	 		remove:remove, 
 	 		update: update,
 	 		get : get,
 	 		displayTime : displayTime};
 })();