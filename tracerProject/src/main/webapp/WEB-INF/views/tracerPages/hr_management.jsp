<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>인적 자원 관리</title>
    <meta charset="utf-8">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div id="app">
        <hr-management></hr-management>
    </div>

    <!-- Add User Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addUserModalLabel">사용자 추가</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="addUserForm">
                        <div class="mb-3">
                            <label for="addUserName" class="form-label">이름</label>
                            <input type="text" class="form-control" id="addUserName" v-model="addFormData.name" required>
                        </div>
                        <div class="mb-3">
                            <label for="addUserEmail" class="form-label">이메일</label>
                            <input type="email" class="form-control" id="addUserEmail" v-model="addFormData.email" required>
                        </div>
                        <div class="mb-3">
                            <label for="addUserBirth" class="form-label">생일</label>
                            <input type="date" class="form-control" id="addUserBirth" v-model="addFormData.birth" required>
                        </div>
                        <div class="mb-3">
                            <label for="addUserPhone" class="form-label">전화번호</label>
                            <input type="text" class="form-control" id="addUserPhone" v-model="addFormData.phone" required>
                        </div>
                        <div class="mb-3">
                            <label for="addUserNickname" class="form-label">닉네임</label>
                            <input type="text" class="form-control" id="addUserNickname" v-model="addFormData.nickname" required>
                        </div>
                        <div class="mb-3">
                            <label for="addUserPassword" class="form-label">비밀번호</label>
                            <input type="password" class="form-control" id="addUserPassword" v-model="addFormData.password" required>
                        </div>
                        <button type="submit" class="btn btn-primary" @click.prevent="addUser">저장</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit User Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editUserModalLabel">사용자 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editUserForm">
                        <div class="mb-3">
                            <label for="editUserName" class="form-label">이름</label>
                            <input type="text" class="form-control" id="editUserName" v-model="editFormData.name" required>
                        </div>
                        <div class="mb-3">
                            <label for="editUserEmail" class="form-label">이메일</label>
                            <input type="email" class="form-control" id="editUserEmail" v-model="editFormData.email" required>
                        </div>
                        <div class="mb-3">
                            <label for="editUserBirth" class="form-label">생일</label>
                            <input type="date" class="form-control" id="editUserBirth" v-model="editFormData.birth" required>
                        </div>
                        <div class="mb-3">
                            <label for="editUserPhone" class="form-label">전화번호</label>
                            <input type="text" class="form-control" id="editUserPhone" v-model="editFormData.phone" required>
                        </div>
                        <div class="mb-3">
                            <label for="editUserNickname" class="form-label">닉네임</label>
                            <input type="text" class="form-control" id="editUserNickname" v-model="editFormData.nickname" required>
                        </div>
                        <button type="submit" class="btn btn-primary" @click.prevent="updateUser">저장</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
    Vue.component('hr-management', {
        data: function() {
            return {
                users: ${userInfoListJson != null ? userInfoListJson : '[]'},
                addFormData: {
                    name: '',
                    email: '',
                    birth: '',
                    phone: '',
                    nickname: '',
                    password: '' 
                },
                editFormData: {
                    name: '',
                    email: '',
                    birth: '',
                    phone: '',
                    nickname: ''
                },
                addUserModal: null,  // 모달 인스턴스를 저장할 변수
                editUserModal: null, // 모달 인스턴스를 저장할 변수
            }
        },
        template: `
        <div>
            <div class="app-card app-card-orders-table shadow-sm mb-5">
                <div class="app-card-body">
                    <div class="table-responsive">
                        <table class="table app-table-hover mb-0 text-left">
                            <thead>
                                <tr>
                                    <th class="cell">이름</th>
                                    <th class="cell">이메일</th>
                                    <th class="cell">생일</th>
                                    <th class="cell">전화번호</th>
                                    <th class="cell">소속 팀</th>
                                    <th class="cell">진행중인 프로젝트</th>
                                    <th class="cell">상세</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="user in users" :key="user.email">
                                    <td class="cell">{{ user.name }}</td>
                                    <td class="cell">{{ user.email }}</td>
                                    <td class="cell">{{ formatDate(user.birth) }}</td>
                                    <td class="cell">{{ user.phone }}</td>
                                    <td class="cell">
                                        <div v-for="team in user.teams" :key="team.tid">{{ team.tid }}</div>
                                    </td>
                                    <td class="cell">
                                        <div v-for="project in user.projects" :key="project.title">{{ project.title }}</div>
                                    </td>
                                    <td class="cell">
                                        <button @click="showEditUserForm(user)" class="btn btn-primary btn-sm">수정</button>
                                        <button @click="deleteUser(user.email)" class="btn btn-danger btn-sm">삭제</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <button @click="showAddUserForm()" class="btn btn-success">사용자 추가</button>
                </div>
            </div>
        </div>
        `,
        mounted() {
            console.log("Users Data:", this.users);  // users 데이터가 제대로 넘어왔는지 확인
            const addUserModalElement = document.getElementById('addUserModal');
            const editUserModalElement = document.getElementById('editUserModal');

            if (addUserModalElement) {
                this.addUserModal = new bootstrap.Modal(addUserModalElement, {});
            } else {
                console.error("Add User Modal element not found");
            }

            if (editUserModalElement) {
                this.editUserModal = new bootstrap.Modal(editUserModalElement, {});
            } else {
                console.error("Edit User Modal element not found");
            }
        },
        methods: {
            showAddUserForm() {
                this.addFormData = { name: '', email: '', birth: '', phone: '', nickname: '', password: '' };
                if (this.addUserModal) {
                    this.addUserModal.show();
                } else {
                    console.error("Add User Modal instance is not initialized");
                }
            },
            showEditUserForm(user) {
                this.editFormData = { ...user };
                this.editFormData.birth = this.formatDate(user.birth);

                if (this.editUserModal) {
                    this.editUserModal.show();
                } else {
                    console.error("Edit User Modal instance is not initialized");
                }

                this.$nextTick(() => {
                    document.getElementById('editUserName').value = this.editFormData.name;
                    document.getElementById('editUserEmail').value = this.editFormData.email;
                    document.getElementById('editUserBirth').value = this.editFormData.birth;
                    document.getElementById('editUserPhone').value = this.editFormData.phone;
                    document.getElementById('editUserNickname').value = this.editFormData.nickname;
                });
            },
            addUser() {
                axios.post('/addUser', this.addFormData, {
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => {
                    this.users.push(response.data);
                    if (this.addUserModal) {
                        this.addUserModal.hide();
                    }
                })
                .catch(error => {
                    alert('사용자 추가 실패: ' + (error.response ? error.response.data : error.message));
                });
            },
            updateUser() {
                axios.post('/updateUser', this.editFormData, {
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => {
                    alert('사용자가 성공적으로 수정되었습니다.');
                    let index = this.users.findIndex(user => user.email === this.editFormData.email);
                    if (index !== -1) {
                        this.$set(this.users, index, response.data);
                    }
                    if (this.editUserModal) {
                        this.editUserModal.hide();
                    }
                })
                .catch(error => {
                    alert('사용자 수정 실패: ' + (error.response ? error.response.data : error.message));
                });
            },
            deleteUser(email) {
                if (confirm('정말 삭제하시겠습니까?')) {
                    axios.post('/deleteUser', { email: email }, {
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    })
                    .then(response => {
                        let index = this.users.findIndex(user => user.email === email);
                        if (index !== -1) {
                            this.users.splice(index, 1);
                        }
                    })
                    .catch(error => {
                        alert('사용자 삭제 실패: ' + (error.response ? error.response.data : error.message));
                    });
                }
            },
            formatDate(date) {
                let d = new Date(date);
                return d.getFullYear() + '-' + ('0' + (d.getMonth() + 1)).slice(-2) + '-' + ('0' + d.getDate()).slice(-2);
            }
        }
    });

    new Vue({
        el: '#app'
    });
    </script>
</body>
</html>
