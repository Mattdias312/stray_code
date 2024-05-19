import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { RouterOutlet } from '@angular/router';
import { FooterComponent } from './footer/footer.component';
import { HeaderComponent } from './header/header.component';
import { MaterialModule } from './material.module';

@Component({
  selector: 'app-root',
  standalone: true,
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
  imports: [RouterOutlet, ReactiveFormsModule,
    CommonModule,  FooterComponent, HeaderComponent,
    MaterialModule],
})
export class AppComponent implements OnInit {
  // title = 'stray-code-app';
  constructor () {

  }

  ngOnInit(): void {
  }
}
