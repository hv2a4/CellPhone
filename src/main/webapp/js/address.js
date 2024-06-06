const citis = document.getElementById("city");
const districts = document.getElementById("district");
const wards = document.getElementById("ward");

const cityName = document.getElementById("cityName");
const districtName = document.getElementById("districtName");
const wardName = document.getElementById("wardName");

fetch('https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json')
    .then(response => response.json())
    .then(data => {
        populateSelect(citis, data, 'Name', 'Id');

        citis.addEventListener('change', () => {
            const selectedCity = data.find(city => city.Id === citis.value);
            cityName.value = citis.options[citis.selectedIndex].text;
            populateSelect(districts, selectedCity ? selectedCity.Districts : [], 'Name', 'Id');
            wards.length = 1; // Reset wards
            wardName.value = ""; // Reset wardName
        });

        districts.addEventListener('change', () => {
            const selectedCity = data.find(city => city.Id === citis.value);
            const selectedDistrict = selectedCity ? selectedCity.Districts.find(district => district.Id === districts.value) : null;
            districtName.value = districts.options[districts.selectedIndex].text;
            populateSelect(wards, selectedDistrict ? selectedDistrict.Wards : [], 'Name', 'Id');
            wardName.value = ""; // Reset wardName
        });

        wards.addEventListener('change', () => {
            wardName.value = wards.options[wards.selectedIndex].text;
        });
    });

function populateSelect(selectElement, items, textKey, valueKey) {
    selectElement.length = 1; // Clear existing options except the first one
    items.forEach(item => {
        const option = new Option(item[textKey], item[valueKey]);
        selectElement.add(option);
    });
}