import { Component } from '@angular/core';

@Component({
  selector: 'app-user-list',
  imports: [],
  templateUrl: './user-list.html',
  styleUrl: './user-list.scss',
})
export class UserList {
  text = 'testo statico da variabile';

  imgLogo = '/angular-corso-34/src/app/user-list/angular2.jpg';

  getText() {
    return 'testo da getText()';
  }

  getDynamicText(text: string) {
    return 'dynamic text: ' + text;
  }

  sum(a: number, b: number) {
    return a + b;
  }

  get imgLogoSrc() {
    return this.imgLogo;
  }

  set imgLogoSrc(value: string) {
    this.imgLogo = value;
  }

  onClick() {
    this.imgLogo = '/angular-corso-34/src/app/user-list/angular.png';
  }

  onReset() {
    this.imgLogo = '/angular-corso-34/src/app/user-list/angular2.jpg';
  }
}

