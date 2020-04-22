/**
 *
 * @param State Machine
 */

import { Machine } from "xstate";

const menuMachine = Machine({
  initial: "closed",
  states: {
    closed: {
      on: {
        OPEN: "opening",
      },
    },
    opening: {
      invoke: {
        src: "openMenu",
        onDone: { target: "open" },
      },
      on: {
        CLOSE: "closing",
      },
    },
    open: {
      on: {
        CLOSE: "closing",
      },
    },
    closing: {
      invoke: {
        src: "closeMenu",
        onDone: { target: "closed" },
      },
      on: {
        OPEN: "opening",
      },
    },
  },
});

export default menuMachine;
