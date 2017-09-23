// import './add-rxjs-operator'

import { Component, OnInit } from '@angular/core'
import { Castle } from './shared/castle'
import { CastlesComponent } from './castles'
import { ChannelService } from './channel.service'
import { CheckinComponent } from './checkin'
import { GotService } from './got.service'
import { Minion, Creds } from './shared/minion'
import { Socket, Channel, Presence } from './shared/phoenix'

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.css'],
})
export class AppComponent implements OnInit {
  title = 'Game of Thrones'

  castles: Castle[]
  minions: Minion[]
  ready: boolean
  creds: Creds

  constructor(private api: GotService, private chan: ChannelService) {
    this.creds = new Creds("DragonStone", "Jon Snow")
    this.credsChanged({ creds: this.creds })
  }

  ngOnInit() {
    this.getCastles()
    this.getMinions()
  }

  credsChanged(evt: any) {
    this.creds.castle = evt.creds.castle
    this.creds.minion = evt.creds.minion

    if (this.creds.valid && this.ready) {
      this.chan.disconnect()
      this.joinChannel()
    }
  }

  private getCastles() {
    this.api.getCastles().subscribe(
      castles => this.castles = castles,
      error => console.log(error)
    )
  }

  private getMinions() {
    this.api.getMinions().subscribe(
      minions => this.hydrateMinions(minions),
      error => console.log(error)
    )
  }

  private hydrateMinions(minions) {
    this.minions = minions
    this.ready = true
    if (this.creds.valid) {
      this.chan.disconnect()
      this.joinChannel()
    }
  }

  private joinChannel() {
    this.chan.join(this.creds)
    this.chan.presence(this.updateMinions.bind(this))
  }

  private updateMinions(list) {
    this.clearCastles()
    Presence.list(list, (name, { metas: [first, ...l] }) => {
      let castle = this.castleFor(first.castle)

      let m = this.minionFor(name)
      if (!castle.minions) {
        castle.minions = []
      }
      castle.minions.push(m)
    })
  }

  private clearCastles() {
    this.castles.forEach((c) => c.minions = [])
  }

  private minionFor(name: string): Minion {
    return this.minions.find((m) => m.name == name)
  }
  private castleFor(name: string): Castle {
    return this.castles.find((m) => m.name == name)
  }
}
