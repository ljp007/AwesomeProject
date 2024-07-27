// src/services/userService.ts
import axios from 'axios';

export interface User {
  id: number;
  name: string;
  email: string;
  phone: string;
}

export const fetchUsers = async (): Promise<User[]> => {
  try {
    const response = await axios.get('https://jsonplaceholder.typicode.com/users');
    return response.data;
  } catch (error) {
    throw new Error('Error fetching users');
  }
};


