<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <style>
        /* 모달 창 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div id="app">
        <h1>User List</h1>
        <button @click="openModal('create')">Create New User</button>
        <ul>
            <li v-for="user in users" :key="user.email">
                {{ user.name }} 
                <button @click="openModal('edit', user)">Edit</button>
                <button @click="deleteUser(user.email)">Delete</button>
            </li>
        </ul>

        <!-- 모달 창 -->
        <div v-if="showModal" class="modal">
            <div class="modal-content">
                <span class="close" @click="closeModal">&times;</span>
                <h2>{{ isEdit ? 'Edit User' : 'Create User' }}</h2>
                <form @submit.prevent="submitForm">
                    <div>
                        <label>Email:</label>
                        <input type="text" v-model="form.email" :readonly="isEdit" />
                    </div>
                    <div>
                        <label>Password:</label>
                        <input type="password" v-model="form.password" />
                    </div>
                    <div>
                        <label>Nickname:</label>
                        <input type="text" v-model="form.nickname" />
                    </div>
                    <div>
                        <label>Name:</label>
                        <input type="text" v-model="form.name" />
                    </div>
                    <div>
                        <label>Birth:</label>
                        <input type="date" v-model="form.birth" />
                    </div>
                    <div>
                        <label>Phone:</label>
                        <input type="text" v-model="form.phone" />
                    </div>
                    <div>
                        <label>Auth:</label>
                        <input type="text" v-model="form.auth" />
                    </div>
                    <div>
                        <button type="submit">{{ isEdit ? 'Update' : 'Create' }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        const { createApp } = Vue;

        createApp({
            data() {
                return {
                    users: ${users}, // 서버에서 전달된 사용자 리스트
                    showModal: false, // 모달 창 표시 여부
                    isEdit: false, // 수정 모드 여부
                    form: {
                        email: '',
                        password: '',
                        nickname: '',
                        name: '',
                        birth: '',
                        phone: '',
                        auth: ''
                    }
                }
            },
            methods: {
                openModal(mode, user = null) {
                    this.showModal = true;
                    this.isEdit = (mode === 'edit');
                    if (this.isEdit && user) {
                        // 사용자를 수정할 때 기존 데이터를 폼에 채워줍니다.
                        this.form = { ...user };
                    } else {
                        // 새로운 사용자 등록 시 폼을 초기화합니다.
                        this.form = {
                            email: '',
                            password: '',
                            nickname: '',
                            name: '',
                            birth: '',
                            phone: '',
                            auth: ''
                        };
                    }
                },
                closeModal() {
                    this.showModal = false;
                },
                submitForm() {
                    if (this.isEdit) {
                        // 수정된 사용자 정보를 서버로 전송
                        fetch(`/users/update`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(this.form)
                        }).then(response => {
                            if (response.ok) {
                                alert('User updated successfully');
                                location.reload();
                            } else {
                                alert('Failed to update user');
                            }
                        });
                    } else {
                        // 새로운 사용자 정보를 서버로 전송
                        fetch(`/users`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify(this.form)
                        }).then(response => {
                            if (response.ok) {
                                alert('User created successfully');
                                location.reload();
                            } else {
                                alert('Failed to create user');
                            }
                        });
                    }
                },
                deleteUser(email) {
                    if (confirm('Are you sure you want to delete this user?')) {
                        fetch(`/users/delete/${email}`, {
                            method: 'GET'
                        }).then(response => {
                            if (response.ok) {
                                alert('User deleted successfully');
                                location.reload();
                            } else {
                                alert('Failed to delete user');
                            }
                        });
                    }
                }
            }
        }).mount('#app');
    </script>
</body>
</html>
