import { Injectable } from '@angular/core'
import { Http, Response } from '@angular/http'

import { Castle } from './shared/castle'
import { Minion } from './shared/minion'
import { Observable } from 'rxjs/Observable'
import { PhoenixChannels } from './shared/channels'
import { environment } from '../environments/environment'

import 'rxjs/add/operator/map'
import 'rxjs/add/operator/catch'

@Injectable()
export class GotService {
  host = `http://${environment.service_url}`

  constructor(private http: Http) {
    this.http = http
  }

  getMinions(): Observable<Minion[]> {
    let url = `${this.host}/api/minions`
    return this.http.get(url)
      .map(this.hydrateMinions)
      .catch(this.handleError)
  }

  getCastles(): Observable<Castle[]> {
    let url = `${this.host}/api/castles`
    console.log(url)
    return this.http.get(url)
      .map(this.hydrateCastles)
      .catch(this.handleError)
  }

  private hydrateCastles(res: Response): Castle[] {
    let body = res.json()
    let c = []
    body.data.forEach((row) => {
      c.push(new Castle(row))
    })
    return c
  }

  private hydrateMinions(res: Response): Castle[] {
    let body = res.json()
    let c = []
    body.data.forEach((row) => {
      c.push(new Minion(row))
    })
    return c
  }

  private handleError(error: any) {
    let err = error.message || error.statusText || 'Server error'
    console.log(err)
    return Observable.throw(err)
  }
}
