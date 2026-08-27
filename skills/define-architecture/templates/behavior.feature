# language: en
Feature: <Concern>
  <One-line description of the behavior under contract.>
  Normative per ADR-NNNN. A <thing> is valid when <invariant>.

  Scenario: <Name>
    Given <precondition>
    When <trigger>
    Then <observable outcome>
    And <additional constraint>

  Scenario: <Failure/edge case>
    Given <precondition>
    When <invalid input / condition>
    Then <rejection / degradation / error>
    And <surfaced to the caller>
