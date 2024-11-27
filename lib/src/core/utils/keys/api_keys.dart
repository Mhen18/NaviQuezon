//  Location
const apiLocation = 'https://psgc.gitlab.io/api';
const apiEmailJs = 'https://api.emailjs.com/api/v1.0/email/send';

// Endpoints
const endpointRegion = '/regions';
const endpointProvince = '/regions/{region_code}/provinces';
const endpointMunicipality = '/provinces/{province_code}/cities-municipalities';
const endpointBarangay =
    '/cities-municipalities/{city_municipality_code}/barangays';
