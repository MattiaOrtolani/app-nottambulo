import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { CreateLocaleRequest, Locale, UpdateLocaleRequest } from '../models/locale.model';

@Injectable({
  providedIn: 'root'
})
export class LocaleApiService {
  private readonly http = inject(HttpClient);
  private readonly apiBaseUrl = environment.apiBaseUrl;

  getNearby(lat: number, lon: number): Observable<Locale[]> {
    return this.http.get<Locale[]>(`${this.apiBaseUrl}/locali/nearby`, {
      params: {
        lat,
        lon
      }
    });
  }

  getAll(): Observable<Locale[]> {
    return this.http.get<Locale[]>(`${this.apiBaseUrl}/locali`);
  }

  getById(id: number): Observable<Locale> {
    return this.http.get<Locale>(`${this.apiBaseUrl}/locali/${id}`);
  }

  createLocale(payload: CreateLocaleRequest): Observable<Locale> {
    return this.http.post<Locale>(`${this.apiBaseUrl}/admin/locali`, payload);
  }

  updateLocale(id: number, payload: UpdateLocaleRequest): Observable<Locale> {
    return this.http.put<Locale>(`${this.apiBaseUrl}/admin/locali/${id}`, payload);
  }

  deleteLocale(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiBaseUrl}/admin/locali/${id}`);
  }
}
