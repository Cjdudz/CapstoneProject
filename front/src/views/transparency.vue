<template>
    <div class="transparency-seal">
        <h1>Transparency Seal - Philippine Coast Guard Auxiliary</h1>
        <div v-if="loading">Loading...</div>
        <div v-else>
            <div v-for="(item, index) in seals" :key="index" class="seal-item">
                <img :src="item.image" :alt="item.name">
                <h3>{{ item.name }}</h3>
                <p>{{ item.description }}</p>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            loading: true,
            seals: [
                {
                    name: "About Us",
                    image: "path/to/about_us_image.jpg",
                    description: "Learn more about our organization and its mission."
                },
                {
                    name: "Functions",
                    image: "path/to/functions_image.jpg",
                    description: "Discover the various functions and roles of our organization."
                },
                {
                    name: "Organization",
                    image: "path/to/organization_image.jpg",
                    description: "Get to know the structure and hierarchy of our organization."
                },
                {
                    name: "ISO Certification",
                    image: "path/to/iso_certification_image.jpg",
                    description: "Learn about our ISO certification and commitment to quality."
                },
                {
                    name: "2015 Score Card",
                    image: "path/to/2015_score_card_image.jpg",
                    description: "View our organization's performance scorecard for the year 2015."
                },
                {
                    name: "2016 Score Card",
                    image: "path/to/2016_score_card_image.jpg",
                    description: "View our organization's performance scorecard for the year 2016."
                },
                {
                    name: "2017 Score Card",
                    image: "path/to/2017_score_card_image.jpg",
                    description: "View our organization's performance scorecard for the year 2017."
                },
                {
                    name: "2020 Score Card",
                    image: "path/to/2020_score_card_image.jpg",
                    description: "View our organization's performance scorecard for the year 2020."
                },
                {
                    name: "2021 Scorecard",
                    image: "path/to/2021_score_card_image.jpg",
                    description: "View our organization's performance scorecard for the year 2021."
                }
            ]
        };
    },
    mounted() {
        // You can still keep this if you want to fetch data dynamically
        // fetch('path/to/sealsData.json')
        //     .then(response => response.json())
        //     .then(data => {
        //         this.seals = data;
        //         this.loading = false;
        //     })
        //     .catch(error => {
        //         console.error('Error fetching data:', error);
        //     });

        // For demonstration, I've commented out the fetch request and pre-populated the data.
        // You can uncomment the fetch request above to fetch data dynamically from an API or JSON file.
        // The commented out code assumes you have a JSON file with the same structure as the 'seals' data object.
        // Ensure to handle loading and error states accordingly.
        this.loading = false; // Assuming data is pre-populated
    }
};
</script>

<style>
/* Add your CSS styles here */
.transparency-seal {
    max-width: 800px;
    margin: 0 auto;
}

.seal-item {
    margin-bottom: 20px;
}
</style>
