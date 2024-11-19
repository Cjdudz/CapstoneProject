<template>
  <div class="announcement-management">
    <h1 class="title">Applicant Announcement Management</h1>

    <!-- Search, Sort, and Filter Controls -->
    <div class="controls">
      <div class="search-wrapper">
        <input
          v-model="searchQuery"
          type="text"
          placeholder="Search announcements..."
          class="search-input"
        />
        <SearchIcon class="search-icon" />
      </div>
      <div class="select-wrapper">
        <select v-model="sortBy" class="sort-select">
          <option value="date">Sort by Date</option>
          <option value="title">Sort by Title</option>
          <option value="priority">Sort by Priority</option>
        </select>
        <ChevronDownIcon class="select-icon" />
      </div>
      <div class="select-wrapper">
        <select v-model="filterCategory" class="filter-select">
          <option value="">All Categories</option>
          <option v-for="category in categories" :key="category" :value="category">
            {{ category }}
          </option>
        </select>
        <ChevronDownIcon class="select-icon" />
      </div>
    </div>

    <!-- Toggle Form Button -->
    <button @click="toggleForm" class="btn btn-primary toggle-form-btn">
      {{ showForm ? 'Hide Form' : 'Create New Announcement' }}
    </button>

    <!-- Announcement Form -->
    <Transition name="slide-fade">
      <form v-if="showForm" @submit.prevent="submitAnnouncement" class="announcement-form">
        <div class="form-group">
          <label for="title">Title</label>
          <input
            id="title"
            v-model="currentAnnouncement.title"
            type="text"
            required
            placeholder="Enter announcement title"
          />
        </div>
        <div class="form-group">
          <label for="content">Content</label>
          <textarea
            id="content"
            v-model="currentAnnouncement.content"
            rows="4"
            required
            placeholder="Enter announcement content"
          ></textarea>
        </div>
        <div class="form-row">
          <div class="form-group">
            <label for="category">Category</label>
            <div class="select-wrapper">
              <select id="category" v-model="currentAnnouncement.category" required>
                <option v-for="category in categories" :key="category" :value="category">
                  {{ category }}
                </option>
              </select>
              <ChevronDownIcon class="select-icon" />
            </div>
          </div>
          <div class="form-group">
            <label for="priority">Priority</label>
            <div class="select-wrapper">
              <select id="priority" v-model="currentAnnouncement.priority" required>
                <option v-for="priority in priorities" :key="priority" :value="priority">
                  {{ priority }}
                </option>
              </select>
              <ChevronDownIcon class="select-icon" />
            </div>
          </div>
        </div>
        <div class="form-group">
          <label for="targetGroup">Target Group</label>
          <div class="select-wrapper">
            <select id="targetGroup" v-model="currentAnnouncement.targetGroup" required>
              <option v-for="group in targetGroups" :key="group" :value="group">
                {{ group }}
              </option>
            </select>
            <ChevronDownIcon class="select-icon" />
          </div>
        </div>
        <div class="form-group">
          <label for="link">Link (optional)</label>
          <input
            id="link"
            v-model="currentAnnouncement.link"
            type="url"
            placeholder="https://example.com"
          />
        </div>
        <div class="form-group">
          <label for="expiration">Expiration Date (optional)</label>
          <input
            id="expiration"
            v-model="currentAnnouncement.expirationDate"
            type="date"
          />
        </div>
        <div class="form-actions">
          <button
            v-if="isEditing"
            @click="cancelEdit"
            type="button"
            class="btn btn-secondary"
          >
            Cancel
          </button>
          <button type="submit" class="btn btn-primary">
            {{ isEditing ? 'Update' : 'Create' }} Announcement
          </button>
        </div>
      </form>
    </Transition>

    <!-- Preview Modal -->
    <Transition name="fade">
      <div v-if="showPreview" class="modal-overlay" @click="showPreview = false">
        <div class="modal" @click.stop>
          <div class="modal-content">
            <h2>{{ currentAnnouncement.title }}</h2>
            <p class="announcement-meta">
              <span class="meta-item">
                <FolderIcon class="icon" />
                {{ currentAnnouncement.category }}
              </span>
              <span class="meta-item">
                <FlagIcon class="icon" />
                {{ currentAnnouncement.priority }}
              </span>
              <span class="meta-item">
                <UsersIcon class="icon" />
                {{ currentAnnouncement.targetGroup }}
              </span>
            </p>
            <p class="announcement-content">{{ currentAnnouncement.content }}</p>
            <a v-if="currentAnnouncement.link" :href="currentAnnouncement.link" target="_blank" class="announcement-link">
              <LinkIcon class="icon" />
              Read More
            </a>
            <p v-if="currentAnnouncement.expirationDate" class="announcement-expiration">
              <CalendarIcon class="icon" />
              Expires: {{ formatDate(currentAnnouncement.expirationDate) }}
            </p>
            <button @click="showPreview = false" class="btn btn-secondary">Close Preview</button>
          </div>
        </div>
      </div>
    </Transition>

    <!-- Announcements List -->
    <div class="announcements-list">
      <TransitionGroup name="list" tag="div">
        <div
          v-for="announcement in paginatedAnnouncements"
          :key="announcement.id"
          class="announcement-card"
        >
          <div class="announcement-header">
            <h3 class="announcement-title">{{ announcement.title }}</h3>
            <span class="announcement-priority" :class="`priority-${announcement.priority}`">
              {{ announcement.priority }}
            </span>
          </div>
          <div class="announcement-meta">
            <span class="meta-item">
              <FolderIcon class="icon" />
              {{ announcement.category }}
            </span>
            <span class="meta-item">
              <UsersIcon class="icon" />
              {{ announcement.targetGroup }}
            </span>
          </div>
          <p class="announcement-content">{{ truncateContent(announcement.content) }}</p>
          <p v-if="announcement.expirationDate" class="announcement-expiration">
            <CalendarIcon class="icon" />
            Expires: {{ formatDate(announcement.expirationDate) }}
          </p>
          <div class="announcement-actions">
            <a
              v-if="announcement.link"
              :href="announcement.link"
              target="_blank"
              rel="noopener noreferrer"
              class="btn btn-preview"
            >
              <LinkIcon class="icon" />
              Read More
            </a>
            <button
              @click="previewAnnouncement(announcement)"
              class="btn btn-preview"
            >
              <EyeIcon class="icon" />
              Preview
            </button>
            <button
              @click="editAnnouncement(announcement)"
              class="btn btn-edit"
            >
              <EditIcon class="icon" />
              Edit
            </button>
            <button
              @click="deleteAnnouncementConfirm(announcement.id)"
              class="btn btn-delete"
            >
              <TrashIcon class="icon" />
              Delete
            </button>
          </div>
        </div>
      </TransitionGroup>
    </div>

    <!-- Pagination -->
    <div class="pagination">
      <button
        @click="currentPage--"
        :disabled="currentPage === 1"
        class="btn btn-secondary"
      >
        <ChevronLeftIcon class="icon" />
        Previous
      </button>
      <span>Page {{ currentPage }} of {{ totalPages }}</span>
      <button
        @click="currentPage++"
        :disabled="currentPage === totalPages"
        class="btn btn-secondary"
      >
        Next
        <ChevronRightIcon class="icon" />
      </button>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, watch } from 'vue';
import axios from 'axios';
import { 
  SearchIcon, ChevronDownIcon, FolderIcon, FlagIcon, UsersIcon, 
  LinkIcon, CalendarIcon, EyeIcon, EditIcon, TrashIcon,
  ChevronLeftIcon, ChevronRightIcon 
} from 'lucide-vue-next';

const API_URL = 'https://pcga505th.online//api'; // Update this to your actual API URL

const announcements = ref([]);
const currentAnnouncement = ref({
  title: '',
  content: '',
  category: 'general',
  priority: 'medium',
  targetGroup: 'all',
  link: '',
  expirationDate: ''
});

const categories = ['general', 'application', 'interview', 'offer'];
const priorities = ['low', 'medium', 'high'];
const targetGroups = ['all', 'new', 'interviewing', 'offered'];

const isEditing = ref(false);
const searchQuery = ref('');
const sortBy = ref('date');
const filterCategory = ref('');
const currentPage = ref(1);
const itemsPerPage = 5;
const showPreview = ref(false);
const showForm = ref(false);

const loadAnnouncements = async () => {
  try {
    const response = await axios.get(`${API_URL}/announcements`);
    announcements.value = response.data;
  } catch (error) {
    console.error('Error loading announcements:', error);
    alert('Failed to load announcements. Please try again.');
  }
};

const submitAnnouncement = async () => {
  try {
    if (isEditing.value) {
      await axios.put(`${API_URL}/editannouncements/${currentAnnouncement.value.id}`, currentAnnouncement.value);
    } else {
      await axios.post(`${API_URL}/createannouncements`, currentAnnouncement.value);
    }
    await loadAnnouncements();
    resetForm();
    showForm.value = false;
  } catch (error) {
    console.error('Error submitting announcement:', error);
    alert('Failed to submit announcement. Please try again.');
  }
};

const editAnnouncement = (announcement) => {
  currentAnnouncement.value = { ...announcement };
  isEditing.value = true;
  showForm.value = true;
};

const cancelEdit = () => {
  resetForm();
  showForm.value = false;
};

const deleteAnnouncementConfirm = async (id) => {
  if (confirm('Are you sure you want to delete this announcement?')) {
    try {
      await axios.delete(`${API_URL}/deleteannouncements/${id}`);
      await loadAnnouncements();
    } catch (error) {
      console.error('Error deleting announcement:', error);
      alert('Failed to delete announcement. Please try again.');
    }
  }
};

const resetForm = () => {
  currentAnnouncement.value = {
    title: '',
    content: '',
    category: 'general',
    priority: 'medium',
    targetGroup: 'all',
    link: '',
    expirationDate: ''
  };
  isEditing.value = false;
};

const previewAnnouncement = (announcement) => {
  currentAnnouncement.value = { ...announcement };
  showPreview.value = true;
};

const toggleForm = () => {
  showForm.value = !showForm.value;
  if (!showForm.value) {
    resetForm();
  }
};

const filteredAnnouncements = computed(() => {
  return announcements.value
    .filter(a => 
      (a.title.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
      a.content.toLowerCase().includes(searchQuery.value.toLowerCase())) &&
      (filterCategory.value === '' || a.category === filterCategory.value)
    )
    .sort((a, b) => {
      if (sortBy.value === 'date') {
        return new Date(b.createdAt) - new Date(a.createdAt);
      } else if (sortBy.value === 'priority') {
        const priorityOrder = { high: 3, medium: 2, low: 1 };
        return priorityOrder[b.priority] - priorityOrder[a.priority];
      } else {
        return a.title.localeCompare(b.title);
      }
    });
});

const totalPages = computed(() => 
  Math.ceil(filteredAnnouncements.value.length / itemsPerPage)
);

const paginatedAnnouncements = computed(() => {
  const start = (currentPage.value - 1) * itemsPerPage;
  const end = start + itemsPerPage;
  return filteredAnnouncements.value.slice(start, end);
});

const truncateContent = (content, maxLength = 100) => {
  if (content.length <= maxLength) return content;
  return content.substr(0, maxLength) + '...';
};

const formatDate = (dateString) => {
  return new Date(dateString).toLocaleDateString();
};

watch(filteredAnnouncements, () => {
  currentPage.value = 1;
});

onMounted(loadAnnouncements);
</script>

<style scoped>
.announcement-management {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
  font-family: 'Arial', sans-serif;
  background-color: #f8f9fa;
  min-height: 100vh;
}

.title {
  font-size: 2.5rem;
  color: #2c3e50;
  margin-bottom: 2rem;
  text-align: center;
  font-weight: bold;
}

.controls {
  display: flex;
  gap: 1rem;
  margin-bottom: 2rem;
  background-color: #ffffff;
  padding: 1rem;
  border-radius: 0.5rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.search-wrapper, .select-wrapper {
  position: relative;
  flex: 1;
}

.search-input, .sort-select, .filter-select {
  width: 100%;
  padding: 0.75rem 1rem;
  border: 1px solid #e0e0e0;
  border-radius: 0.5rem;
  font-size: 1rem;
  transition: all 0.3s ease;
  background-color: #f8f9fa;
}

.search-input:focus, .sort-select:focus, .filter-select:focus {
  outline: none;
  border-color: #3498db;
  box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
}

.search-icon, .select-icon {
  position: absolute;
  right: 1rem;
  top: 50%;
  transform: translateY(-50%);
  color: #777;
  pointer-events: none;
}

.toggle-form-btn {
  margin-bottom: 1rem;
  width: 100%;
}

.announcement-form {
  background-color: #ffffff;
  padding: 2rem;
  border-radius: 0.5rem;
  margin-bottom: 2rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-row {
  display: flex;
  gap: 1rem;
}

.form-row .form-group {
  flex: 1;
}

label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
  color: #2c3e50;
}

input[type="text"],
input[type="url"],
input[type="date"],
textarea,
select {
  width: 100%;
  padding: 0.75rem;
  border: 1px solid #e0e0e0;
  border-radius: 0.5rem;
  font-size: 1rem;
  transition: all 0.3s ease;
  background-color: #f8f9fa;
}

input[type="text"]:focus,
input[type="url"]:focus,
input[type="date"]:focus,
textarea:focus,
select:focus {
  outline: none;
  border-color: #3498db;
  box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
}

.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 1rem;
}

.btn {
  padding: 0.75rem 1.5rem;
  border: none;
  border-radius: 0.5rem;
  font-size: 1rem;
  cursor: pointer;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.btn-primary {
  background-color: #3498db;
  color: white;
}

.btn-primary:hover {
  background-color: #2980b9;
}

.btn-secondary {
  background-color: #e0e0e0;
  color: #333;
}

.btn-secondary:hover {
  background-color: #d0d0d0;
}

.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal {
  background-color: white;
  padding: 2rem;
  border-radius: 0.5rem;
  max-width: 600px;
  width: 90%;
  max-height: 90vh;
  overflow-y: auto;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.modal-content h2 {
  font-size: 1.8rem;
  margin-bottom: 1rem;
  color: #2c3e50;
}

.announcement-meta {
  display: flex;
  gap: 1rem;
  margin-bottom: 1rem;
}

.meta-item {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.9rem;
  color: #777;
}

.announcement-content {
  margin-bottom: 1rem;
  line-height: 1.6;
  color: #2c3e50;
}

.announcement-link {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  color: #3498db;
  text-decoration: none;
  margin-bottom: 1rem;
  transition: color 0.3s ease;
}

.announcement-link:hover {
  color: #2980b9;
}

.announcement-expiration {
  font-size: 0.9rem;
  color: #777;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.announcements-list {
  display: grid;
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.announcement-card {
  background-color: white;
  border-radius: 1rem;
  padding: 1.5rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 1px 3px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
  border: 1px solid #e0e0e0;
  overflow: hidden;
  position: relative;
}

.announcement-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.12), 0 4px 8px rgba(0, 0, 0, 0.06);
}

.announcement-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(90deg, #3498db, #2ecc71);
}

.announcement-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1rem;
  padding-bottom: 0.5rem;
  border-bottom: 1px solid #e0e0e0;
}

.announcement-title {
  font-size: 1.4rem;
  color: #2c3e50;
  margin: 0;
  font-weight: 600;
}

.announcement-priority {
  font-size: 0.8rem;
  font-weight: bold;
  padding: 0.25rem 0.5rem;
  border-radius: 1rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.priority-high {
  background-color: #e74c3c;
  color: white;
}

.priority-medium {
  background-color: #f39c12;
  color: white;
}

.priority-low {
  background-color: #2ecc71;
  color: white;
}

.announcement-meta {
  display: flex;
  gap: 1rem;
  margin-bottom: 1rem;
  font-size: 0.9rem;
  color: #7f8c8d;
}

.meta-item {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.announcement-content {
  margin-bottom: 1rem;
  line-height: 1.6;
  color: #34495e;
}

.announcement-expiration {
  font-size: 0.9rem;
  color: #95a5a6;
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-top: 1rem;
}

.announcement-actions {
  display: flex;
  gap: 0.5rem;
  margin-top: 1.5rem;
  justify-content: flex-end;
}

.btn-preview, .btn-edit, .btn-delete {
  padding: 0.5rem 1rem;
  border-radius: 0.5rem;
  font-size: 0.9rem;
  font-weight: 600;
  transition: all 0.3s ease;
}

.btn-preview {
  background-color: #3498db;
  color: white;
}

.btn-preview:hover {
  background-color: #2980b9;
}

.btn-edit {
  background-color: #f39c12;
  color: white;
}

.btn-edit:hover {
  background-color: #e67e22;
}

.btn-delete {
  background-color: #e74c3c;
  color: white;
}

.btn-delete:hover {
  background-color: #c0392b;
}

.pagination {
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 1rem;
  margin-top: 2rem;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.list-enter-active,
.list-leave-active {
  transition: all 0.5s ease;
}

.list-enter-from,
.list-leave-to {
  opacity: 0;
  transform: translateX(30px);
}

.slide-fade-enter-active,
.slide-fade-leave-active {
  transition: all 0.3s ease;
}

.slide-fade-enter-from,
.slide-fade-leave-to {
  transform: translateY(-20px);
  opacity: 0;
}

.icon {
  width: 1.2em;
  height: 1.2em;
}

@media (max-width: 768px) {
  .controls {
    flex-direction: column;
  }

  .form-row {
    flex-direction: column;
  }

  .announcement-actions {
    flex-wrap: wrap;
  }
}
</style>