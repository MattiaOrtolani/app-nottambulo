import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { ShellHeaderComponent } from './core/shell-header.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, ShellHeaderComponent],
  templateUrl: './app.html',
  styleUrl: './app.scss'
})
export class App {}
