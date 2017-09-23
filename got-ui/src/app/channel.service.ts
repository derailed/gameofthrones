import { Injectable }                from '@angular/core'
import { Socket, Channel, Presence } from './shared/phoenix'
import { Creds }                     from './shared/minion'
import { environment }               from '../environments/environment'

@Injectable()
export class ChannelService {
  socket: Socket
  chan: Channel
  presences: any

  url = `ws://${environment.service_url}/socket`

  constructor() {
    this.socket = null
    this.chan = null
  }

  join(creds: Creds) {
    this.connect(creds)
    this.chan = this.socket.channel("kingdoms")
    this.chan.join()
        .receive("ok",    resp => console.log(`Channel Joined!`))
        .receive("error", reason => console.log("CRAP!", reason) )
  }

  connected(): boolean {
    return this.socket != null && this.chan != null
  }

  disconnect(): void {
    if( this.chan ) {
      this.socket.disconnect(null, null, null)
      this.chan.leave()
      this.chan = null
      this.socket = null
    }
  }

  subscribe(evt: string, cb: Function): void {
     this.chan.on(evt, (payload) => cb(evt, payload))
  }

  push(evt: string, payload: any): void {
    this.chan.push(evt, payload)
             .receive("error", e => console.log(e) )
  }

  presence(cb: Function): void {
    this.presences = {}
    this.chan.on("presence_state", state => {
      Presence.syncState(this.presences, state, null, null)
      cb(this.presences)
    })

    this.chan.on("presence_diff", diff => {
      Presence.syncDiff(this.presences, diff, null, null)
      cb(this.presences)
    })
  }

  private listBy(name: string, {metas: [first, ...rest]}): any {
    console.log(name, first, rest)
    first.name  = name
    first.count = rest.length+1
    return first
  }

  private connect(loginInfo: any): void {
    this.socket = new Socket(this.url, {
      params: { castle: loginInfo.castle, minion: loginInfo.minion },
    })
    this.socket.connect()
  }
}
