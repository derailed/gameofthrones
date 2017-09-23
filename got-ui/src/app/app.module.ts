import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http'


import { AppComponent } from './app.component';
import { CheckinComponent } from './checkin'
import { CastleComponent } from './castle'
import { CastlesComponent } from './castles'
import { GotService } from './got.service'
import { ChannelService } from './channel.service'
import { MinionComponent } from './minion'
import { MissiveComponent } from './missive'
import { OrderPipe } from './shared/order.pipe'

@NgModule({
  declarations: [
    AppComponent,
    CastleComponent,
    CastlesComponent,
    CheckinComponent,
    MissiveComponent,
    MinionComponent,
    OrderPipe
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule
  ],
  providers: [GotService, ChannelService],
  bootstrap: [AppComponent]
})
export class AppModule { }
