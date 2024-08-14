<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>인적 자원 관리</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/vue@3.2.36/dist/vue.global.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <style>
        td {
            text-align: center;
        }
    </style>
</head>
<body>
<div id="app" class="container">
    <div class="jumbotron text-center">
        <h2>인적 자원 관리</h2>
        <p v-if="users.length === 0">사용자 데이터를 불러오고 있습니다...</p>
    </div>
    <div class="mb-3">
        <button @click="showAddUserForm" class="btn btn-success">사용자 추가</button>
    </div>
    <table class="table table-hover table-striped">
        <thead>
            <tr class="table-success text-center">
                <th>이름</th>
                <th>이메일</th>
                <th>닉네임</th>
                <th>생일</th>
                <th>전화번호</th>
                <th>진행중인 프로젝트</th>
                <th>현재 권한</th>
                <th>액션</th>
            </tr>
        </thead>
        <tbody>
            <tr v-if="users.length === 0">
                <td colspan="8">사용자 데이터가 없습니다.</td>
            </tr>
            <tr v-else v-for="user in users" :key="user.email">
                <td>{{ user.name }}</td>
                <td>{{ user.email }}</td>
                <td>{{ user.nickname }}</td>
                <td>{{ new Date(user.birth).toLocaleDateString() }}</td>
                <td>{{ user.phone }}</td>
                <td>
                    <div v-for="project in user.projects">{{ project.title }}</div>
                </td>
                <td>
                    <div v-for="team in user.teams">{{ team.auth }}</div>
                </td>
                <td>
                    <button @click="editUser(user)" class="btn btn-primary btn-sm">수정</button>
                    <button @click="deleteUser(user.email)" class="btn btn-danger btn-sm">삭제</button>
                </td>
            </tr>
        </tbody>
    </table>

    <!-- 사용자 추가 및 수정 모달 -->
    <div v-if="showForm">
        <form @submit.prevent="saveUser">
            <div>
                <label>이름:</label>
                <input v-model="formData.name" required>
            </div>
            <div>
                <label>이메일:</label>
                <input v-model="formData.email" required>
            </div>
            <div>
                <label>생일:</label>
                <input type="date" v-model="formData.birth" required>
            </div>
            <div>
                <label>전화번호:</label>
                <input v-model="formData.phone" required>
            </div>
            <div>
                <label>닉네임:</label>
                <input v-model="formData.nickname" required>
            </div>
            <div>
                <label>비밀번호:</label>
                <input type="password" v-model="formData.password" required>
            </div>
            <button type="submit">저장</button>
            <button @click="showForm = false">취소</button>
        </form>
    </div>
</div>

<script>
    const app = Vue.createApp({
        data() {
            return {
                users: [],  // 초기 상태는 빈 배열로 설정
                showForm: false,
                formData: {
                    name: '',
                    email: '',
                    birth: '',
                    phone: '',
                    nickname: '',
                    password: ''
                },
                editMode: false
            };
        },
        methods: {
        	fetchUsers() {
        	    axios.get('/hrManagement')
        	        .then(response => {
        	            console.log('서버 응답:', response);  // 서버 응답 전체를 출력
        	            if (response.data) {
        	                this.users = response.data;
        	                console.log('Fetched users:', this.users);  // 이 부분에서 users가 올바르게 설정되는지 확인
        	            } else {
        	                console.error('Error: Received empty data.');
        	            }
        	        })
        	        .catch(error => {
        	            console.error('Error fetching users:', error);
        	        });
        	},
            showAddUserForm() {
                this.showForm = true;
                this.editMode = false;
                this.formData = { name: '', email: '', birth: '', phone: '', nickname: '', password: '' };
            },
            editUser(user) {
                this.showForm = true;
                this.editMode = true;
                this.formData = { ...user, password: '' }; // 비밀번호는 빈 문자열로 설정
            },
            saveUser() {
                const url = this.editMode ? '/updateUser' : '/addUser';
                axios.post(url, this.formData)
                    .then(response => {
                        this.fetchUsers();
                        this.showForm = false;
                    })
                    .catch(error => {
                        console.error('Error saving user:', error);
                        alert('사용자 저장 중 오류 발생');
                    });
            },
            deleteUser(email) {
                if (confirm('정말 삭제하시겠습니까?')) {
                    axios.post('/deleteUser', { email })
                        .then(response => {
                            this.fetchUsers();
                        })
                        .catch(error => {
                            console.error('Error deleting user:', error);
                            alert('사용자 삭제 중 오류 발생');
                        });
                }
            }
        },
        mounted() {
            this.fetchUsers();
        }

    app.mount('#app');
</script>

</body>
</html>
