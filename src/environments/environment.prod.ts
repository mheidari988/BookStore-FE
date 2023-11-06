import { Environment } from '@abp/ng.core';

const baseUrl = 'https://tire-management-backend.azurewebsites.net/';

export const environment = {
  production: true,
  application: {
    baseUrl,
    name: 'BookStore',
    logoUrl: '',
  },
  oAuthConfig: {
    issuer: 'https://tire-management-backend.azurewebsites.net/',
    redirectUri: baseUrl,
    clientId: 'BookStore_App',
    responseType: 'code',
    scope: 'offline_access BookStore',
    requireHttps: true,
  },
  apis: {
    default: {
      url: 'https://tire-management-backend.azurewebsites.net/',
      rootNamespace: 'Acme.BookStore',
    },
  },
} as Environment;
