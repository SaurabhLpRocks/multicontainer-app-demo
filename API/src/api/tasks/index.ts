import * as Hapi from "hapi";

import { IDatabase } from "../../database";
import { IServerConfigurations } from "../../configurations";
import Routes from "./routes";

export function init(
  server: Hapi.Server,
  configs: IServerConfigurations,
  database: IDatabase
) {
  Routes(server, configs, database);
}
