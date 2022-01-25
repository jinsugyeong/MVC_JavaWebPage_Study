### 학원 수업 혼자 실습 해보기
<br>

***Do List🤔***
- [ ] MVC model 2 mysql 방법 알아보기
- [ ] id 중복검사 popup창으로 띄워서 db랑 비교하기
- [ ] form에 유효성 검사 추가하기
- [x] goods Folder code 완성
- [x] DAO,DTO 이용하기

<br><br>

***MVC model 2***
| Date | Note |
| :---: | --- |

<br><br>

***MVC model 1***
| Date | Note |
| :---: | --- |
| `22/01/08` | goods_update_action 완성<br>goods_search_list,goods_admin DAO/DTO로 수정 |
| `22/01/07` | goods_delete_action, goods_update_form 완성 |
| `22/01/06` | goods_insert form,action 페이지 완성 |
| `22/01/05` | encoding 수정, top.jsp 다시 |
| `22/01/04` | checkbox로 다중정렬 조건받기 성공<br>module/top.jsp 수정 |
| `21/12/28` | db 연결 수정<br> insert,update,delete,search,login처리 DAO,DTO로 |
| `21/12/27` | insert처리 useBean,DTO,DAO로 수정 |
| `21/12/21` | 상품테이블 추가, 검색처리 |
| `21/12/19` | include,redirect,session 응용 |
| `21/12/19` | search처리 |
| `21/12/18` | delete처리 |
| `21/12/18` | insert/list/update 처리 |
| `21/12/17` | db연결 다시 하기 |
| `21/12/13` | jdbc-mysql로 연결해보기 |
| `21/12/12` | get/post로 화면에 입력받아서 회원가입창 만들어보기 |
| `21/12/11` | layout 나눠서 include 활용하기 |

<br><br>

***issue🤦‍♀️🤦‍♀️***
> 현재 git 자체를 사용하지 않고 eclipse marketplace에 있는 egit을 다운받아 사용중인데
220106 학원에서 commit,push 완료한 내역이 github에 적용이 안되는 것을 220107에 push까지 마친 상태에서 알게됨
구글링 하던 중 학원 이클립스 워크스페이스의 Author와 Committer의 이메일을 잘못적었다는것을 알았지만
검색결과가 모두 git과 terminal을 이용한 해결방안이라 everydaycommit은 xx.. 이라고 생각하고 있을 때
github 사이트에서 해결...ㅎ
원래 username <useremail@domain>인데 username <username@domain>으로 써서 생겼던 문제


> 위의 commit 미반영 issue 때문에 아무것도 모르면서 git history 이것저것 만져보다가 revert를 하는 불상사 발생...
reset으로 돌렸는데 push해서 github 저장소까지 수정하려고 하니 충돌 일어남
branch명인 master(or main)앞에 +붙여주거나 force 체크박스 체크하고 push하면 해결
