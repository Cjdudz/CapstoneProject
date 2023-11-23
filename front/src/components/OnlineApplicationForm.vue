<template>
  <div class="pagination-container">
    <p>PAGES</p>

    <div v-for="(page, index) in paginatedLinks" :key="index">
      <router-link v-for="link in page" :key="link.to" v-bind:to="link.to" class="pagination-link">{{ link.label }}</router-link>
    </div>

    <div class="pagination-buttons">
      <button @click="prevPage" :disabled="currentPage === 1" class="pagination-button">Previous Page</button>
      <button @click="nextPage" :disabled="currentPage === totalPages" class="pagination-button">Next Page</button>
    </div>
  </div>
</template>


    <script>
    export default {
      name: 'LandingPage',
      data() {
        return {
          links: [
            { to: '/PcgaapplicationForm', label: 'PCGA Application Form' },
            { to: '/MembershipapplicationPAge1', label: 'Membership Application Page 1' },
            { to: '/MembershipapplicationPAge2', label: 'Membership Application Page 2' },
            { to: '/MembershipapplicationPAge5', label: 'Membership Application Page 3' },
            { to: '/MembershipapplicationPAge4', label: 'Membership Application Page 4' },
            { to: '/Personalhistory', label: 'Personal History' },
            { to: '/Maritalhistory', label: 'Marital History' },
            { to: '/MilitaryHistory', label: 'Military History' },
            { to: '/CountryVisited', label: 'Country Visited' },
            { to: '/Neighbors', label: 'Neighbors' },
            { to: '/LastpageApplication', label: 'Last Page Application' },
          ],
          itemsPerPage: 3,
          currentPage: 1,
        };
      },
      computed: {
        totalPages() {
          return Math.ceil(this.links.length / this.itemsPerPage);
        },
        paginatedLinks() {
          const startIndex = (this.currentPage - 1) * this.itemsPerPage;
          const endIndex = startIndex + this.itemsPerPage;
          return this.links.slice(startIndex, endIndex).map(link => [link]);
        },
      },
      methods: {
        nextPage() {
          if (this.currentPage < this.totalPages) {
            this.currentPage += 1;
          }
        },
        prevPage() {
          if (this.currentPage > 1) {
            this.currentPage -= 1;
          }
        },
      },
    };
    </script>

    <style scoped>
      h1 {
        color: #333;
        text-align: center;
      }

      p {
        color: #555;
        text-align: center;
      }

      div {
        max-width: 600px;
        margin: 0 auto;
      }

      router-link {
        display: block;
        margin-bottom: 10px;
        padding: 8px;
        background-color: #3498db;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        text-align: center;
        transition: background-color 0.3s;
      }

      router-link:hover {
        background-color: #2980b9;
      }
      .pagination-container {
  max-width: 600px;
  margin: 0 auto;
  text-align: center;
}

.pagination-link {
  display: block;
  margin-bottom: 10px;
  padding: 8px;
  background-color: #3498db;
  color: #fff;
  text-decoration: none;
  border-radius: 5px;
  text-align: center;
  transition: background-color 0.3s;
}

.pagination-link:hover {
  background-color: #2980b9;
}

.pagination-buttons {
  margin-top: 10px;
  display: flex;
  justify-content: center;
}

.pagination-button {
  padding: 8px;
  background-color: #2ecc71;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.pagination-button:disabled {
  background-color: #bdc3c7;
  cursor: not-allowed;
}

.pagination-button:hover:disabled {
  background-color: #bdc3c7;
}

.pagination-button:hover {
  background-color: #27ae60;
}
      button {
        padding: 8px;
        margin-top: 10px;
        background-color: #2ecc71;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
      }

      button:disabled {
        background-color: #bdc3c7;
        cursor: not-allowed;
      }

      button:hover:disabled {
        background-color: #bdc3c7;
      }

      button:hover {
        background-color: #27ae60;
      }
    </style>
